# Day 10 - SSH Deep Dive

## Topics Covered
- How SSH works under the hood — key exchange, authentication flow
- Key auth vs password auth — why keys are better
- SSH config file — shortcuts and per-server settings
- SSH file permissions — 600 for keys, 700 for .ssh folder
- SCP — securely copying files over SSH
- SSH security hardening — sshd_config settings
- Viewing SSH logs — auth.log, failed attempts, successful logins
- SSH tunnelling — local, remote, dynamic port forwarding
- SSH key management — multiple keys, ssh-add, authorized_keys

## Key Takeaways
- Private key stays on your machine forever — never share it
- Public key goes on every server you want to access
- SSH refuses to use keys with wrong permissions — always chmod 600
- PasswordAuthentication no is the most important server security setting
- authorized_keys on server controls who can log in — delete a line to revoke access
- SSH tunnelling lets you securely access services not exposed to internet
- known_hosts tracks servers you've connected to — mismatch = warning
