# Run with
#  docker run --rm --name mopidy 
#             -p 6680:6680 -p 6600:6600 
#             -e SPOTIFY_USERNAME -e SPOTIFY_PASSWORD 
#             -e LASTFM_USERNAME -e LASTFM_PASSWORD
#             -v /tmp/snapcast:/tmp 
#             stilllman/mopidy --snapcast


FROM ubuntu:16.04
RUN  apt-get update
RUN  apt-get install -y \
     wget
RUN  wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add -
RUN  wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/jessie.list
RUN  apt-get update
RUN  apt-get install -y \
     python-pip mopidy
RUN  apt-get remove -y python-pyasn1
RUN  pip install Mopidy-Scrobbler Mopidy-TuneIn Mopidy-Moped Mopidy-GMusic Mopidy-Party

COPY mopidy.conf /root/.config/mopidy_default.conf
COPY mopidy.sh /usr/local/bin/mopidy.sh

EXPOSE 6600 6680
ENTRYPOINT ["/usr/local/bin/mopidy.sh"]
