FROM ubuntu:trusty

RUN apt-get update && apt-get -y install git sudo make gcc cmake libsctp-dev lksctp-tools
WORKDIR /root/
RUN git clone https://gitlab.eurecom.fr/oai/openair-cn.git
WORKDIR /root/openair-cn/

RUN ./SCRIPTS/build_mme -i -f


COPY startup.sh ./
RUN chmod +x startup.sh

ENTRYPOINT /root/openair-cn/startup.sh


