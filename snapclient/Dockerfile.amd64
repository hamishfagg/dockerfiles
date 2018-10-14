FROM multiarch/debian-debootstrap:amd64-jessie-slim

ARG snapcast_version=0.15.0
ENV HOST snapserver

RUN  apt-get update \
  && apt-get install -y wget ca-certificates \
  && rm -rf /var/lib/apt/lists/*
RUN  wget https://github.com/badaix/snapcast/releases/download/v${snapcast_version}/snapclient_${snapcast_version}_amd64.deb
RUN  dpkg -i snapclient_${snapcast_version}_amd64.deb \
  ;  apt-get update \
  && apt-get -f install -y \
  && rm -rf /var/lib/apt/lists/*
RUN snapclient -v
ENTRYPOINT ["/bin/bash","-c","snapclient -h $HOST"]
