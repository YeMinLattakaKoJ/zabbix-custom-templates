# Zabbix Custom Templates

This repository contains custom Zabbix templates for monitoring **network devices** and **specific services/applications**.  
These templates are designed to extend Zabbix’s default capabilities and provide better visibility into infrastructure health.

---

## 📡 Templates Included

### 1. Template
A general-purpose template for monitoring routers, switches, firewalls, and other network appliances.

---

### 2. Custom Template(s)
Custom templates tailored for specific use cases.

---

## 🛠 Requirements
- **Zabbix 6.0+** (tested; may also work on newer versions)
- SNMP enabled on network devices (for Network Device Template)
- Zabbix agent / custom scripts for some custom templates

---

## 📥 Import Instructions
1. In the Zabbix UI, go to **Configuration → Templates**.  
2. Click **Import**.  
3. Select the desired `.yaml` template file from this repository.  
4. Assign the template to a host or group.  

---

## 🤝 Contribution
Feel free to fork this repository, add your own templates, and submit pull requests.  
Sharing templates helps the Zabbix community grow stronger 🚀.
