#!/bin/bash
DOMAIN=$1
openssl genrsa 4096 > account.key
openssl genrsa 4096 > domain.key
openssl req -new -sha256 -key domain.key -subj "/" -reqexts SAN -config <(cat /etc/ssl/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:www.$DOMAIN,DNS:static.$DOMAIN,DNS:passport.$DOMAIN,DNS:admin.$DOMAIN,DNS:nexus.$DOMAIN,DNS:blog.$DOMAIN,DNS:api.$DOMAIN,DNS:$DOMAIN")) > domain.csr
