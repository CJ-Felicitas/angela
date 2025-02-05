#!/bin/bash

# kill script if failed
set -e

# requires the full domain name, subdomain (for directory purposes), and email
read -p "Full Domain Name: " DOMAIN
read -p "Subdomain: " SUBDOMAIN
read -p "Email: " EMAIL

# create directory before obtaining ssl certificate since linux is case sensitive (lmao)
sudo mkdir -p ~/opulenz-infra/certbot/conf/$SUBDOMAIN

# initiate obtain ssl certificate
sudo certbot certonly --standalone -d $DOMAIN --email $EMAIL --agree-tos

# get the SSL certificate and key and copy to docker compose setup since nginx is running in docker
sudo cp /etc/letsencrypt/live/$DOMAIN/fullchain.pem ~/reverse-proxy/certbot/conf/$SUBDOMAIN/
sudo cp /etc/letsencrypt/live/$DOMAIN/privkey.pem ~/reverse-proxy/certbot/conf/$SUBDOMAIN/

# reconfig the permissions 
sudo chmod 644 ~/opulenz-infra/certbot/conf/$SUBDOMAIN/fullchain.pem
sudo chmod 600 ~/opulenz-infra/certbot/conf/$SUBDOMAIN/privkey.pem

echo "SSL certificate for $DOMAIN has been obtained and configured."