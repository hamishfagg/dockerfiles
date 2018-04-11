FROM multiarch/ubuntu-debootstrap:amd64-xenial-slim
RUN  apt-get update
RUN  apt-get install -y software-properties-common
RUN  apt-add-repository universe
RUN  apt-get install -y wget
RUN  wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add -
RUN  wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/jessie.list
RUN  apt-get update --fix-missing
RUN  apt-get install -y python-pip mopidy build-essential libspotify12 python-spotify gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly
RUN  apt-get remove -y python-pyasn1
RUN  pip install Mopidy-TuneIn Mopidy-GMusic Mopidy-Spotify Mopidy-Moped Mopidy-Party

COPY mopidy.conf /root/.config/mopidy_default.conf
COPY mopidy.sh /usr/local/bin/mopidy.sh

EXPOSE 6600 6680
ENTRYPOINT ["/usr/local/bin/mopidy.sh"]
