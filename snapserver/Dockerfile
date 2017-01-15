FROM debian:jessie

ARG  snapcast_version=0.10.0

RUN  apt-get update \
  && apt-get install -y \
     wget \
  && rm -rf /var/lib/apt/lists/*
RUN  wget https://github.com/badaix/snapcast/releases/download/v${snapcast_version}/snapserver_${snapcast_version}_amd64.deb
RUN  dpkg -i snapserver_${snapcast_version}_amd64.deb \
  ;  apt-get update \
  && apt-get -f install -y \
  && rm -rf /var/lib/apt/lists/*
EXPOSE 1704 1705
ENTRYPOINT ["snapserver"]

