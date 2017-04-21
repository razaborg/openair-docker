#/bin/bash

# STEP 1 : mysql setup 
mkdir -p /usr/local/etc/oai/freeDiameter
#sed -e "s/@MYSQL_user@/${MYSQL_user}/" -e "s/@MYSQL_pass@/${MYSQL_pass}/" ETC/hss.conf > /usr/local/etc/oai/hss.conf 

cp /config/hss.conf /usr/local/etc/oai/

# STEP 2 : config file creation
cp /config/acl.conf /config/hss_fd.conf /usr/local/etc/oai/freeDiameter

# STEP 3 : configure FQDN
echo "Hostname (FQDN): $(hostname -f)"
echo "Hostname (host): $(hostname)"

# STEP 4 : check certificates
./SCRIPTS/check_hss_s6a_certificate /usr/local/etc/oai/freeDiameter $(hostname)

# Mysql daemon run
service mysql start
mysql -u root -e "create database oai_db"
mysql -u root oai_db < ./SRC/OAI_HSS/db/oai_db.sql

# HSS daemon start
./SCRIPTS/run_hss -i ./SRC/OAI_HSS/db/
