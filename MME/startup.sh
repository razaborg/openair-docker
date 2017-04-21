#/bin/bash

cd /root/openair-cn
mkdir -p /usr/local/etc/oai/freeDiameter

cp /config/mme.conf /usr/local/etc/oai/

cp /config/mme_fd.conf /usr/local/etc/oai/freeDiameter/

./SCRIPTS/build_mme --clean

./SCRIPTS/check_mme_s6a_certificate /usr/local/etc/oai/freeDiameter $(hostname -f)


./SCRIPTS/run_mme 
