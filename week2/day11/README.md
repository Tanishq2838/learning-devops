# Day 11 - Firewalls, ufw, Linux Networking Internals

## Topics Covered
- What a firewall does — inbound vs outbound rules
- ufw — Ubuntu's simplified firewall tool
- ufw commands — allow, deny, delete, default policies
- iptables basics — INPUT/OUTPUT/FORWARD chains, rule structure
- Why iptables is dangerous without care — can lock you out of SSH
- Network interfaces — lo, eth0, wlan0, docker0
- Routing table — default gateway concept
- Network namespaces — foundation for Docker/Kubernetes networking
- Full server hardening exercise combining SSH + firewall

## Key Takeaways
- Default deny incoming, allow outgoing is the standard secure baseline
- Always allow SSH BEFORE enabling a deny-all firewall policy
- ufw is a simplified frontend for iptables — both control the same thing
- Cross-check ss -tulnp against ufw status to catch unexpected exposed services
- Every Docker container gets its own network namespace — same concept used in Kubernetes pods
