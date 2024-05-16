FROM alpine/git AS git
WORKDIR /librespot
RUN git clone --depth 1 --branch v0.4.1 https://github.com/librespot-org/librespot.git .


FROM alpine:3.16 as librespot-build
WORKDIR /app
RUN apk -U add git build-base cargo alsa-lib-dev
COPY --from=git /librespot .
#RUN cargo --config net.git-fetch-with-cli=true build --release --features alsa-backend
RUN cargo build --release --features alsa-backend


FROM alpine:3.16 AS snapweb-build
WORKDIR /snapcast
RUN apk add npm curl alpine-sdk
RUN npm install --silent --save-dev -g typescript@4.3
RUN curl -L https://github.com/badaix/snapweb/archive/refs/tags/v0.3.0.tar.gz | tar xz --directory / && cd /snapweb-0.3.0 && make



FROM alpine:3.16

#RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk add --no-cache musl
RUN rm /etc/apk/repositories && apk add --no-cache snapcast-server dbus avahi avahi-compat-libdns_sd alsa-lib libgcc mpv \
    --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing # We need the latest snapserver

COPY --from=snapweb-build /snapweb-0.3.0/dist /usr/share/snapserver/snapweb
COPY --from=librespot-build /app/target/release/librespot /usr/bin/librespot
COPY snapserver.conf /etc/snapserver.conf
COPY startup.sh startup.sh
RUN chmod +x ./startup.sh

EXPOSE 1704 1705 1780
ENTRYPOINT [ "./startup.sh" ]
