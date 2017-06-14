FROM ubuntu:trusty

RUN apt-get update && apt-get -y install git sudo wget
WORKDIR /root/

RUN git clone -b develop https://gitlab.eurecom.fr/oai/openair-cn.git
WORKDIR /root/openair-cn/

RUN DEBIAN_FRONTEND=noninteractive ./scripts/build_hss -i -F 

# HSS build
RUN ./scripts/build_hss -F --clean --debug

# for debug purposes
RUN sudo apt install iputils-ping

#USER root
COPY startup.sh ./
RUN chmod +x startup.sh
ENTRYPOINT /bin/bash -c "source ./startup.sh"
