#!/usr/bin/sh
DOMAIN=seongspa.42.fr
openssl genrsa -des3 -out ${DOMAIN}.key 2048
openssl req -key ${DOMAIN}.key -new -out ${DOMAIN}.csr
openssl x509 -signkey ${DOMAIN}.key -in ${DOMAIN}.csr -req -days 365 -out ${DOMAIN}.crt

mkdir -p ../nginx/cert
mv ${DOMAIN}.* ../nginx/cert
