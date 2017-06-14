FROM ubuntu:14.04

RUN apt-get update && apt-get -y install git sudo make gcc cmake libsctp-dev lksctp-tools wget
WORKDIR /root/
RUN git clone -b develop https://gitlab.eurecom.fr/oai/openair-cn.git 
WORKDIR /root/openair-cn/

RUN DEBIAN_FRONTEND=noninteractive ./scripts/build_mme -i -f

RUN DEBIAN_FRONTEND=noninteractive ./scripts/build_mme --clean -v


COPY startup.sh ./
RUN chmod +x startup.sh

ENTRYPOINT /root/openair-cn/startup.sh


