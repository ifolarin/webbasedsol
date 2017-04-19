#! /bin/bash


#Clone and build openldap
git clone https://github.com/ifolarin/docker-openldap.git
cd docker-openldap/example/extend-osixia-openldap/
docker build -t webbasedsol/openldap:0.3.4 .
docker tag  webbasedsol/openldap:0.3.4 webbasedsol/openldap:latest
cd -

#Clone and build phpLDAPadmin
git clone https://github.com/ifolarin/docker-phpLDAPadmin.git
cd docker-phpLDAPadmin/example/extend-dinkel-phpldapadmin/
docker build -t webbasedsol/phpldapadmin:0.1.2 . 
docker tag  webbasedsol/phpldapadmin:0.1.2 webbasedsol/phpldapadmin:latest
cd -

#Clone and build rainloop
git clone https://github.com/ifolarin/docker-rainloop.git
cd docker-rainloop/extend-runningman84-rainloop/
docker build -t webbasedsol/rainloop:0.1.0 .
docker tag  webbasedsol/rainloop:0.1.0 webbasedsol/rainloop:latest
cd -


#Clone and build backoffice application
mkdir -p config/letsencrypt/log
mkdir -p config/letsencrypt/etc
cd config/letsencrypt
docker run --rm -ti -v $PWD/log/:/var/log/letsencrypt -v $PWD/etc/:/etc/letsencrypt/ -p 443:443 haocen/certbot:latest certonly --standalone -d mail.webbasedsol.com
cd - 



#Enable firewall
echo -e "Enabling ufw firewall..."
ufw enable

#Allowing port traffic
echo -e "Enabling ports..."

echo -e "ssh..."
ufw allow ssh
echo -e "done."
 
echo -e "http..."
ufw allow http
echo -e "done."

echo -e "https..."
ufw allow https
echo -e "done."

echo -e "143..."
ufw allow 143
echo -e "done."

echo -e "587..."
ufw allow 587
echo -e "done."


