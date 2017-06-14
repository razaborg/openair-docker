#/bin/bash

cd /root/openair-cn
mkdir -p /usr/local/etc/oai/freeDiameter

# Get the IP configuration
export S6A_IFACE="eth0"
export S6A_IP=$(ip addr show ${S6A_IFACE} | grep 'inet ' | awk '{ print $2}')

export S1C_IFACE="eth0"
export S1C_IP=$(ip addr show ${S1C_IFACE} | grep 'inet ' | awk '{ print $2}')

export S11_IFACE="eth1"
export S11_IP=$(ip addr show ${S11_IFACE} | grep 'inet ' | awk '{ print $2}')

envsubst < /config/mme.conf > /usr/local/etc/oai/mme.conf


# Et pour avoir l'IP des autres composants --> résolution DNS \o/
export HSS_HOST="hss"
export HSS_IP=$(host ${HSS_HOST} | egrep -o "has address [0-9]+.+" | cut -d " " -f3)

envsubst < /config/mme_fd.conf > /usr/local/etc/oai/freeDiameter/mme_fd.conf 

#./SCRIPTS/build_mme --clean

./scripts/check_mme_s6a_certificate /usr/local/etc/oai/freeDiameter $(hostname -f)
./scripts/run_mme 
