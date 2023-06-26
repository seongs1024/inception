read -p "DOMAIN: " DOMAIN

echo "==GENERATE $DOMAIN.key=="
openssl genrsa -des3 -out $DOMAIN.key 2048
if [ $? -ne 0 ]; then
    echo "\-> FAILED!"
    exit 1
fi
echo "==GENERATE $DOMAIN.csr=="
openssl req -key $DOMAIN.key -new -out $DOMAIN.csr
if [ $? -ne 0 ]; then
    echo "\-> FAILED!"
    exit 1
fi
echo "==GENERATE $DOMAIN.crt=="
openssl x509 -signkey $DOMAIN.key -in $DOMAIN.csr -req -days 365 -out $DOMAIN.crt
if [ $? -ne 0 ]; then
    echo "\-> FAILED!"
    exit 1
fi
echo "==GENERATE $DOMAIN.pass=="
touch $DOMAIN.pass
read -sp "Password: " PASSWORD
echo $PASSWORD >> $DOMAIN.pass
