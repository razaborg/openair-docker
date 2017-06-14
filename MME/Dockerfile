FROM ubuntu:15.10

RUN apt-get update && apt-get -y install git sudo make gcc cmake libsctp-dev lksctp-tools wget
WORKDIR /root/
RUN git clone https://gitlab.eurecom.fr/pok/openair-cn.git
WORKDIR /root/openair-cn/

RUN DEBIAN_FRONTEND=noninteractive ./SCRIPTS/build_mme -i -f

RUN DEBIAN_FRONTEND=noninteractive ./SCRIPTS/build_mme --clean -v


COPY startup.sh ./
RUN chmod +x startup.sh

ENTRYPOINT /root/openair-cn/startup.sh


