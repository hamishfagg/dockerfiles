FROM python:3.10

RUN apt update && apt install -y build-essential cmake libportaudio2
RUN pip install ledfx

ENTRYPOINT "sh" "-c" "ledfx"