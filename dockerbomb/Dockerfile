FROM resin/rpi-raspbian:jessie

RUN curl -sSL https://get.docker.com/ | sh
RUN systemctl enable docker

ENTRYPOINT ["docker","run","-it","--rm","ivdata/dockerbomb"]
