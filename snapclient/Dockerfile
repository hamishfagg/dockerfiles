FROM alpine

ENV HOST snapserver

RUN apk add -U snapcast-client
RUN rm -rf /var/cache/apk/*
ENTRYPOINT /usr/bin/snapclient -h $HOST $EXTRA_ARGS
