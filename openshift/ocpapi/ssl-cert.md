# SSL Certs


1. Create directory

`sudo mkdir -p /etc/nginx/ssl`


1. Generate the Private Key:

`sudo openssl genpkey -algorithm RSA -out /etc/nginx/ssl/openshift.key`



1. Generate the Certificate

`sudo openssl req -new -x509 -key /etc/nginx/ssl/openshift.key -out /etc/nginx/ssl/openshift.crt -days 365 \
  -subj "/C=SG/ST=Singapore/L=Singapore/O=home/OU=openshift/CN=mylab.com/emailAddress=admin@home.mylab.com"`

1. list files

`sudo ls -l /etc/nginx/ssl`

