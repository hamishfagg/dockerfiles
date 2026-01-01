# Snapcast Server
This is a docker image for the [snapcast server](https://github.com/badaix/snapcast), that includes [go-librespot](https://github.com/devgianlu/go-librespot).


## Run Snapserver
To run, use the command below, but you can change the following values:

* `1705, 1704, and 1780` the ports used by Snapserver (1780 is for the web UI). You currently can't configure the internal ports used but can change the external ones.
* `snapserver.conf` an optional Snapserver config file. If you omit this, a default config will be used (see below).
* `EXTRA_ARGS` an optional string of cmd line arguments to pass to `snapserver`.

`docker run --rm -v /tmp/snapcast:/tmp/snapcast -p 1704:1704 -p 1705:1705 -p 1780:1780 -e EXTRA_ARGS=<x> ivdata/snapserver`

## Config
You can overwrite snapcast's config by mounting a file to `/etc/snapserver.conf` in the container. The default config runs go-librespot to make a spotify connect device. See the [Snapcast docs](https://github.com/badaix/snapcast/blob/master/doc/configuration.md) to create your own config.
