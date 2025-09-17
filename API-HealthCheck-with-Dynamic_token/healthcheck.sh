#!/bin/bash

# Paths to store the token and expiry time
TOKEN_FILE="/usr/lib/zabbix/externalscripts/token/api_token"
TOKEN_EXPIRY_FILE="/usr/lib/zabbix/externalscripts/token/api_token_expiry"

# Function to generate a new token
generate_token() {
    RESPONSE=$(curl -s --location 'https://your-token-url.com/api/token' \
    --header 'Content-Type: application/json' \
    --header 'Authorization: Bearer {{your_master_token}}' \
    --data '{
        "Id" : "<id>",
        "passCode" : "<password>",
    }')

    TOKEN=$(echo "$RESPONSE" | jq -r '.token')  # Adjust the jq filter based on the actual response structure
    EXPIRY_TIME=$(($(date +%s) + 600))  # Token expiry time (10 minutes from now)
    echo "$TOKEN" > "$TOKEN_FILE"
    echo "$EXPIRY_TIME" > "$TOKEN_EXPIRY_FILE"
}

# Check if the token file exists
if [[ ! -f "$TOKEN_FILE" || ! -f "$TOKEN_EXPIRY_FILE" ]]; then
    generate_token
fi

# Read the token and expiry time
TOKEN=$(cat "$TOKEN_FILE")
EXPIRY_TIME=$(cat "$TOKEN_EXPIRY_FILE")
CURRENT_TIME=$(date +%s)

# Check if the token has expired
if [[ "$CURRENT_TIME" -ge "$EXPIRY_TIME" ]]; then
    generate_token
    TOKEN=$(cat "$TOKEN_FILE")
fi

# Perform the health check
HEALTH_CHECK=$(curl -s --location 'https://your-health-check-url.com/api/health-check' \
--header 'Content-Type: application/json' \
--header "Authorization: Bearer $TOKEN" \
--data '{
    "branchId": "<branchid>",
    "branchCode": "<branchcode>",
    "branchName": "<branchname>"
}')

# Output the result
echo "$HEALTH_CHECK"
