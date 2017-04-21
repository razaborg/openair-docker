FROM ubuntu:trusty

RUN apt-get update && apt-get -y install git sudo make gcc cmake
WORKDIR /root/
RUN git clone https://gitlab.eurecom.fr/oai/openair-cn.git
WORKDIR /root/openair-cn/

RUN ./SCRIPTS/build_hss -i -F
#RUN ./SCRIPTS/check_hss_s6a_certificate

ENV MYSQL_user "root" 
ENV MYSQL_pass ""


# HSS build
RUN ./SCRIPTS/build_hss -F --clean --debug

COPY startup.sh ./
RUN chmod +x startup.sh


ENTRYPOINT /root/openair-cn/startup.sh
