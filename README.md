# Zabbix Custom Templates

This repository contains a collection of **custom Zabbix templates** I use for monitoring network devices, servers, applications, and databases.  
They extend Zabbix’s default capabilities with extra items, triggers, and graphs tailored for real-world infrastructure.

---

## 📂 Templates

| Category          | Template                                | Description |
|-------------------|-----------------------------------------|-------------|
| Network Devices   | `template-network-device-snmp.yaml`     | Generic SNMP-based monitoring for routers, switches, firewalls (interfaces, traffic, errors, availability). |
|                   | `template-f5-bigip-pool-member-snmp.yaml` | Monitors F5 Big-IP pool members via SNMP, including health and status. |
|                   | `template-efficient-ip-snmp.yaml`       | Template for monitoring EfficientIP appliances with SNMP. |
| Databases         | `template-patroni-db.yaml`              | Monitors Patroni PostgreSQL clusters (replication role, status, etc.). |
| Applications      | `template-api-healthcheck-dynamic-token.yaml` | API health check with dynamic authentication token. |
| Servers           | `template-linux-custom.yaml` (example)  | Custom Linux server monitoring (CPU, memory, disk, processes). |

---

## 🛠 Requirements

- **Zabbix 6.0+** (tested; should work on later versions as well).  
- SNMP enabled on network devices (for SNMP-based templates).  
- Zabbix Agent installed on hosts (for server/application templates).  
- Some templates require **user macros** (e.g., API token, SNMP community).  

---

## 📥 Import Instructions

1. In the Zabbix web UI, go to **Configuration → Templates**.  
2. Click **Import**.  
3. Upload the desired `.yaml` template from this repository.  
4. Assign the template to your host(s).  

---

## 🚨 Example Triggers

- Network interface utilization > 80%  
- High CPU load for > 5 minutes  
- Disk space usage above 90%  
- API returns unexpected status code  
- Patroni node not in expected role (leader/replica)  

---

## 📊 Example Graphs

- Interface traffic (bits/s)  
- CPU load average (1/5/15 min)  
- Memory usage breakdown  
- Database replication lag  
- API response time  

---

## 🤝 Contributing

I welcome contributions!  
If you have your own Zabbix templates, feel free to fork, add them under the right category, and submit a pull request.  

MIT License – you are free to use, modify, and share these templates.  
See [LICENSE](LICENSE) for details.
