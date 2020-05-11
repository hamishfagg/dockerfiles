# Snapcast Server
This is a docker image for the [snapcast server](https://github.com/badaix/snapcast).

If you want to use Snapcast to make your own multiroom audio setup, please check out [Mopidy-Multiroom](https://github.com/IVData/dockerfiles/tree/master/mopidy-multiroom).

## Run Snapserver
To run, use the command below, but you can change the following values:

* `/tmp/snapcast` a temporary directory for Snapcast to create it's fifo inside.
* `1705, 1704, and 1780` the ports used by Snapserver (1780 is for the web UI). You currently can't configure the internal ports used but can change the external ones.
* `snapserver.conf` an optional Snapserver config file. If you omit this, a default config will be used (see below).

`docker run --rm -v /tmp/snapcast:/tmp/snapcast -p 1704:1704 -p 1705:1705 -p 1780:1780 ivdata/snapserver`

## Config
You can overwrite snapcast's config by mounting a file to `/etc/snapserver.conf` in the container. The default settings create a single stream called "Snapserver" and enable the [websockets interface](https://github.com/badaix/snapcast-websockets-ui) on port 1780. See the Snapcast docs to create your own config.

## Snapcast Updates
This dockerfile uses an environment variable for the Snapcast version. If a newer version of Snapcast is available you can rebuild this image to use it - then please let me know that Snapcast has been updated so that I can update my repo.
