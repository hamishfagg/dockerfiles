FROM alpine

ENV HOST=snapserver
ENV PORT=4953

RUN apk add -U --no-cache sox netcat-openbsd
ENTRYPOINT ["sh", "-c", "sox -n -t wav -b 16 -r 48k --buffer 32 - synth brownnoise tremolo .1 20 | nc $HOST $PORT"]
