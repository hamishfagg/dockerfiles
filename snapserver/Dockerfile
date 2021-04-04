FROM debian:buster-slim

ARG  snapcast_version=0.24.0
ARG TARGETARCH

RUN  apt-get update \
  && apt-get install -y wget ca-certificates \
  && rm -rf /var/lib/apt/lists/*
RUN  wget https://github.com/badaix/snapcast/releases/download/v${snapcast_version}/snapserver_${snapcast_version}-1_$(echo $TARGETARCH | sed 's/arm/armhf/g').deb
RUN  dpkg -i snapserver_${snapcast_version}-1_$(echo $TARGETARCH | sed 's/arm/armhf/g').deb \
  ;  apt-get update \
  && apt-get -f install -y \
  && rm -rf /var/lib/apt/lists/*
RUN /usr/bin/snapserver -v
COPY snapserver.conf /etc/snapserver.conf
EXPOSE 1704 1705 1780
ENTRYPOINT ["/bin/bash","-c","/usr/bin/snapserver"]
