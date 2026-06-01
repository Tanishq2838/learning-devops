# Day 8 - Networking Fundamentals

## Topics Covered
- How the internet works — full request lifecycle
- IP addresses — public vs private, subnets, CIDR notation
- Special IPs — localhost, 0.0.0.0, private ranges
- DNS — how domain names become IP addresses
- DNS record types — A, CNAME, MX, TXT, NS
- DNS commands — nslookup, dig, dig +trace
- /etc/hosts — local DNS override
- ping, traceroute, curl, wget, netstat, ss, nmap, nc

## Key Takeaways
- DNS is checked after /etc/hosts — you can override any domain locally
- Private IPs work only inside local network, public IPs face the internet
- /24 subnet = 256 addresses, /16 = 65536 addresses
- curl -I shows only headers, curl -v shows full request/response
- ss -tulnp shows what is listening on which port and which process owns it
- 0.0.0.0 means all interfaces — a service bound here accepts connections from anywhere
