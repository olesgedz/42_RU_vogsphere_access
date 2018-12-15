#!/bin/bash

### We set up the kerberos config file to access to 42's kerberos server.

cat >> /etc/krb5.conf << EOF
[libdefaults]
    default_realm = 21-SCHOOL.RU
    forwardable = true
    proxiable = true
    dns_lookup_kdc = no
    dns_lookup_realm = no
    allow_weak_crypto = true

[realms]
    21-SCHOOL.RU = {
        kdc = kdc.21-school.ru
        admin_server = kdc.21-school.ru
        default_domain = 21-school.ru
        default_lifetime = 7d
        ticket_lifetime = 7d
    }

[domain_realm]
    .21-school.ru = 21-SCHOOL.RU
    21-school.ru = 21-SCHOOL.RU
EOF

### We set up the ssh config file to access to 42's git server (vogsphere)
### using your kerberos identification

cat >> /etc/ssh/ssh_config << EOF
Host *.21-school.ru
     SendEnv LANG LC_*
     StrictHostKeyChecking no
     GSSAPIAuthentication yes
     GSSAPIDelegateCredentials yes
     PasswordAuthentication yes
EOF

echo "root part finished !"
