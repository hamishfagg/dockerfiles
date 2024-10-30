FROM python:3.10

ENV SNAPCAST_HOST 192.168.0.2
ENV SNAPCAST_DEVICE 1

RUN apt update && apt install -y build-essential cmake libportaudio2
RUN pip install numpy
RUN pip install ledfx
RUN wget https://github.com/badaix/snapcast/releases/download/v0.28.0/snapclient_0.28.0-1_amd64-bookworm.deb \
	&& apt install -f -y ./snapclient_0.28.0-1_amd64-bookworm.deb

ENTRYPOINT "sh" "-c" "(ledfx &) && snapclient --hostID ledfx -h $SNAPCAST_HOST -s $SNAPCAST_DEVICE"
