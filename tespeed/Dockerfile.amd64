FROM python:2.7-wheezy

RUN git clone --recursive --depth 1 https://github.com/IVData/tespeed.git
RUN pip install lxml

CMD ["/usr/local/bin/python","/tespeed/tespeed.py"]
