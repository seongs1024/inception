#!/usr/bin/sh

read -p "DOMAIN=" DOMAIN
read -p "PASS=" PASS
echo ${PASS} > ${DOMAIN}.pass
openssl genrsa -des3 -out ${DOMAIN}.key 2048
openssl req -key ${DOMAIN}.key -new -out ${DOMAIN}.csr
openssl x509 -signkey ${DOMAIN}.key -in ${DOMAIN}.csr -req -days 365 -out ${DOMAIN}.crt

mkdir -p ../nginx/cert
mv ${DOMAIN}.* ../nginx/cert
