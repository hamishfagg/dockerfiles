FROM golang:1.25-alpine AS build-go-librespot

ARG GO_LIBRESPOT_VERSION="v0.6.2"
WORKDIR /go-librespot

RUN apk -U --no-cache add gcc g++ alsa-lib-dev libogg-dev libvorbis-dev git flac-dev pkgconf
RUN git clone https://github.com/devgianlu/go-librespot.git --branch ${GO_LIBRESPOT_VERSION} .

RUN go mod download
RUN CGO_ENABLED=1 GOOS=linux go build -v ./cmd/daemon



FROM alpine:3.20 AS snapweb

ARG SNAPWEB_VERSION="v0.9.3"
RUN apk add --no-cache unzip wget
RUN wget https://github.com/badaix/snapweb/releases/download/${SNAPWEB_VERSION}/snapweb.zip && \
    unzip snapweb.zip -d snapweb



FROM alpine:3.20

RUN apk add --no-cache python3 py3-websocket-client py3-requests musl libpulse avahi libgcc gcompat alsa-lib avahi-compat-libdns_sd alsa-lib libgcc mpv
RUN rm /etc/apk/repositories && apk add --no-cache snapcast \
    --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing # We need the latest snapserver

# COPY --from=snapweb-build /snapweb-0.3.0/dist /usr/share/snapserver/snapweb
COPY --from=build-go-librespot /go-librespot/daemon /usr/bin/go-librespot
COPY snapserver.conf /etc/snapserver.conf
COPY go-librespot.yml /go-librespot/config.yml
COPY startup.sh startup.sh
COPY --from=snapweb /snapweb /usr/share/snapserver/snapweb
RUN chmod +x ./startup.sh

EXPOSE 1704 1705 1780
ENTRYPOINT [ "./startup.sh" ]
