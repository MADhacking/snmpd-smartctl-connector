snmpd-smartctl-connector
========================

Unfortunately, neither the net-analyzer/net-snmp or sys-apps/smartmontools packages provide a suitable SNMPD extension script to enable the SNMP daemon to access harddisk SMART data.

The snmp-agents/snmpd-smartctl-connector package aims to rectify this by providing an SNMPD extension script and a helper script which together enable the SNMP daemon to be used to remotely monitor the health of the attached disk devices. Available information includes Drive Serial Number, Temperature, Reallocated Sector Count, Current Pending Sector Count, Off-line Uncorrectable Sector Count and UDMA CRC Error Count. Various drive lifetime indicators are also monitored including Read Error Rate, Seek Error Rate and Hardware ECC Recovered Rate.

More information may be found at:

http://www.mad-hacking.net/software/linux/agnostic/snmpd-smartctl-connector/index.xml
