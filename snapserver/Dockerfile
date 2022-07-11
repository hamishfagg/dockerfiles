# We have to build the develop branch of snapserver for now until the next version is released
FROM alpine:edge AS builder
WORKDIR /snapcast

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk add --no-cache curl bash librespot git alpine-sdk libvorbis-dev soxr-dev flac-dev avahi-dev expat-dev boost-dev opus-dev alsa-lib-dev npm
RUN git clone --branch develop https://github.com/badaix/snapcast.git /snapcast
RUN npm install --silent --save-dev -g typescript@4.3
RUN curl -L https://github.com/badaix/snapweb/archive/refs/tags/v0.2.0.tar.gz | tar xz --directory / && cd /snapweb-0.2.0 && make
RUN make server

FROM alpine:edge

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk add --no-cache librespot snapcast-server

COPY --from=builder /snapcast/server/snapserver /usr/bin/
COPY --from=builder /snapweb-0.2.0/dist /usr/share/snapserver/snapweb
COPY snapserver.conf /etc/snapserver.conf
EXPOSE 1704 1705 1780
ENTRYPOINT /usr/bin/snapserver $EXTRA_ARGS

