FROM python:2.7-alpine3.7

RUN apk update
RUN apk add py-pip git
RUN pip install requests dnspython pyasn1==0.3.7 pyasn1-modules==0.1.5

RUN git clone https://github.com/sezuan/SleekXMPP.git -b xep_0363
RUN cd SleekXMPP && pip install .

RUN git clone https://github.com/sezuan/uploadr.git

COPY server.py /uploadr/server.py

ENTRYPOINT ["/bin/sh","-c","cd /uploadr && python server.py"]
