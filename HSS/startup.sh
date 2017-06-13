#/bin/bash
#ping mysqldb

# STEP 1 : mysql setup 
mkdir -p /usr/local/etc/oai/freeDiameter
#sed -e "s/@MYSQL_user@/${MYSQL_user}/" -e "s/@MYSQL_pass@/${MYSQL_pass}/" ETC/hss.conf > /usr/local/etc/oai/hss.conf 

echo " --> hss.conf file copy..."
cp /config/hss.conf /usr/local/etc/oai/

# STEP 2 : config file creation
echo " --> acl.conf & hss_fd.conf files copy..."
cp /config/acl.conf /config/hss_fd.conf /usr/local/etc/oai/freeDiameter

# STEP 3 : configure FQDN
echo "Hostname (FQDN): $(hostname -f)"
echo "Hostname (host): $(hostname -s)"

# STEP 4 : check certificates
echo " --> checking for certificates..."
./SCRIPTS/check_hss_s6a_certificate /usr/local/etc/oai/freeDiameter $(hostname)

# Mysql daemon run
#service mysql start
#service mysql status
#mysql -u root -e "create database oai_db"
echo " --> setting up the example database..."
mysql --host mysqldb -uroot -proot oai_db < ./SRC/OAI_HSS/db/oai_db.sql && echo "[OK] Database Updated" || echo "[FAIL] Database Non Updated"

echo " --> running the daemon"
# HSS daemon start
./SCRIPTS/run_hss -i ./SRC/OAI_HSS/db/
