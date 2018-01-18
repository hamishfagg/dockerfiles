#!/bin/bash

# Copy config if it does not already exist
if [ ! -f /root/.config/mopidy/mopidy.conf ]; then
    mkdir -p /root/.config/mopidy
    cp /root/.config/mopidy_default.conf /root/.config/mopidy/mopidy.conf
fi

# Replace env var values in config
if [ -n "$SPOTIFY_USERNAME" ]; then
    sed -i "/\[spotify\]/,/\[.*\]/ s/username.*/username = ${SPOTIFY_USERNAME}/" /root/.config/mopidy/mopidy.conf
fi
if [ -n "$SPOTIFY_PASSWORD" ]; then
    sed -i "/\[spotify\]/,/\[.*\]/ s/password.*/password = ${SPOTIFY_PASSWORD}/" /root/.config/mopidy/mopidy.conf
fi
if [ -n "$GMUSIC_USERNAME" ]; then
    sed -i "/\[gmusic\]/,/\[.*\]/ s/username.*/username = ${GMUSIC_USERNAME}/" /root/.config/mopidy/mopidy.conf
fi
if [ -n "$GMUSIC_USERNAME" ]; then
    sed -i "/\[gmusic\]/,/\[.*\]/ s/password.*/password = ${GMUSIC_PASSWORD}/" /root/.config/mopidy/mopidy.conf
fi

if [ ${APT_PACKAGES:+x} ]; then
    echo "-- INSTALLING APT PACKAGES $APT_PACKAGES --"
    apt-get install -y $APT_PACKAGES
fi
if  [ ${PIP_PACKAGES:+x} ]; then
    echo "-- INSTALLING PIP PACKAGES $PIP_PACKAGES --"
    pip install $PIP_PACKAGES
fi
if [ ${UPDATE:+x} ]; then
    echo "-- UPDATING ALL PACKAGES --"
    apt-get update
    apt-get upgrade -y
    pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U # Upgrade all pip packages
fi

exec mopidy
