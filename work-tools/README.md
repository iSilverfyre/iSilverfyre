# DC Tools
User-friendly interface for working with the internal tool to reset XenServer API for either a rack or whole pod. Additional options for syncing the power of single racks or a whole pod, useful for power events in the DC affecting whole rows or the entire pod.

# Diag
Can be used alone or in conjunction with the host tools script.  This includes a set list of checks to verify the integrity of the host after an outage has occurred.  Useful for finding the source of an unexpected shutdown.

# Host Tools
User-friendly interface for working with a host during an outage.  Ping and uptime can be used to verify if the host is back online or if it ever went offline.  Vseyes is an internal notification tool to make internal teams aware of the outage.  Syncpower and diagnostics uses the diag script after the host is online to restore power to virtual guests and verify the host is stable. 

# Ticket
Interactive script to fill in small amounts of data to otherwise predetermined and scripted ticket replies.  Good for tickets that require few changes to what is already in the template.
