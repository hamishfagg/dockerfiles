FROM alpine

ENV HOST=snapserver
ENV PORT=4953
ENV LOWPASS=20000

RUN apk add -U --no-cache sox socat
ENTRYPOINT ["sh", "-c", "sox -V -n -t wav -b 16 -c 2 -r 48k --buffer 32 - synth brownnoise lowpass $LOWPASS | socat -u - TCP4:$HOST:$PORT"]
