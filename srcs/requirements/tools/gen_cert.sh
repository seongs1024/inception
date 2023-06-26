#!/bin/sh

set -e

echo "==Configure tls certifications for the domain=="
read -p "DOMAIN: " DOMAIN

touch $DOMAIN.pass
read -sp "Password: " PASSWORD
echo $PASSWORD >> $DOMAIN.pass

printf "\n==GENERATE $DOMAIN.key==\n"
expect gen_ssl_key.exp ${DOMAIN} ${PASSWORD}

printf "\n==GENERATE $DOMAIN.csr==\n"
expect gen_ssl_csr.exp ${DOMAIN} ${PASSWORD}

printf "\n==GENERATE $DOMAIN.crt==\n"
expect gen_ssl_crt.exp ${DOMAIN} ${PASSWORD}
