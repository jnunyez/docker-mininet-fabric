FROM ubuntu:14.04
MAINTAINER Jose <jonunyez@gmail.com>

ENV HOME /root

WORKDIR $HOME
RUN apt-get update && apt-get install -y sudo git tcpdump arping && \
    git clone https://github.com/mininet/mininet.git

WORKDIR $HOME/mininet
RUN git fetch origin pull/758/head:install_of13 && \
    git checkout install_of13

ADD multi_controller.patch .
ADD kill.patch .
RUN git apply multi_controller.patch && \
    git apply kill.patch

WORKDIR $HOME
RUN ./mininet/util/install.sh -n3fv && \
    apt-get clean && apt-get purge -y && apt-get autoremove -y 

ADD mininet_fabric.py .

CMD ["python", "mininet_fabric.py"]
