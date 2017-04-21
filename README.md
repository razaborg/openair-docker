# openair-docker

This repo as for goal to present a properly-dockerized version of the openair-cn project.

### Next steps

+ Use an external freeDiameter container for the MME/HSS
+ Use and external mysql container for the HSS
+ Make a SP_GW container

### Warning : docker for Mac users (windows users might be concerned too)

The SCTP protocol must be enabled (kernel module) in the Hyperkit VM running on alpine Linux.

To enable it, see those posts : 
+ https://stackoverflow.com/questions/43499464/load-kernel-module-from-mac-os-sierra-host-to-a-docker-container/43524373#43524373
+ https://github.com/linuxkit/linuxkit/pull/1675 

# Architecture

The repo is organized as following :

    .
    ├── HSS
    │   └── config
    ├── MME
    │   └── config
    └── openair-cn

A docker-compose file is located at the root allowing you to run a working configuration for the MME/HSS part of the EPC.

The HSS folder contains :
+ Dockerfile to build the base image 
+ startup.sh script to autoconfigure the container at start-up and run the HSS service
+ a config folder containing all the configuration files needed for the HSS


The MME folder contains :
+ Dockerfile to build the base MME image
+ startup.sh script to autoconfigure the container at start-up and run the MME service
+ a config folder containing all the configuration files needed for the MME

The openair-cn is a submodule containing the source code of the [openair-cn project](https://gitlab.eurecom.fr/oai/openair-cn)


# Build the images

    user@host:~/openair-docker/HSS$ docker build . -t openair-hss
    user@host:~/openair-docker/MME$ docker build . -t openair-mme

# Starting the containers 

## using docker-compose :

A docker-compose file is provided to set-up a working environement (pre-configured network, hostname, ip...) with HSS and MME components.

    docker-compose up -d

## the manual way

And in a more archaic way :

    docker run -it -h "hss.openair4G.eur" -v $(pwd)/config:/config openair-hss
    docker run -it -h "mme.openair4G.eur" -v $(pwd)/config:/config openair-mme


But the IP raw defined in the config file (freediameter configuration) will probably fuck everything up... You're warned
