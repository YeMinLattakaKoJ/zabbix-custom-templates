# API Health Check

This repository contains a script for integrating an API health check with Zabbix. The script generates a token and performs a health check, extracting the `branchId` from the API response.

## Prerequisites

- `curl` must be installed on your system.
- `jq` must be installed to parse JSON responses.

## Setup

1. **Create the Bash Script**

   Create a file named `health-check.sh` and add the following content:

2. **Create the Bash Script**
    Set Execute Permissions
    chmod +x health-check.sh

3. **Configure Zabbix Agent**
    Add the following line to your zabbix_agentd.conf:
    UserParameter=api.healthcheck,/path/to/health-check.sh

4. **Restart Zabbix Agent**
    Restart the Zabbix agent to apply the changes:
    sudo systemctl restart zabbix-agent
