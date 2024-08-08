FROM alpine

ENV HOST=snapserver
ENV PORT=4953

RUN apk add -U --no-cache sox socat
ENTRYPOINT ["sh", "-c", "sox -V -n -t wav -b 16 -c 2 -r 48k --buffer 32 - synth brownnoise | socat -u - TCP4:$HOST:$PORT"]
