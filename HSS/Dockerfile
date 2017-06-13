FROM ubuntu:15.10

RUN apt-get update && apt-get -y install git sudo wget

RUN useradd -m openair \
&& usermod --password openair openair \
&& groupadd boss \
&& usermod -aG boss openair \
&& echo '%boss ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers \
&& su openair
USER openair
WORKDIR /home/openair/

RUN git clone https://gitlab.eurecom.fr/oai/openair-cn.git
WORKDIR /home/openair/openair-cn/
#WORKDIR /root/openair-cn/

RUN DEBIAN_FRONTEND=noninteractive ./SCRIPTS/build_hss -i -F 

# HSS build
RUN ./SCRIPTS/build_hss -F --clean --debug

# for debug purposes
RUN sudo apt install inetutils-ping

USER root
COPY startup.sh ./
RUN chmod +x startup.sh
ENTRYPOINT /bin/bash -c "source ./startup.sh"
#RUN ./startup.sh
