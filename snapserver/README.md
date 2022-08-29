# Snapcast Server
This is a docker image for the [snapcast server](https://github.com/badaix/snapcast).

This image runs `avahi-daemon` inside the container in order to advertise the snapcast service (or Spotify connect service if you're using librespot). This will interfere with a host machine that is also running avahi. There are three options to fix this:
- Give this container it's own IP on your local network with a macvlan docker network or similar.
- Disable `avahi-daemon` on the host and run this container with `--net=host`.
- Disable `avahi-daemon` in this container by overriding the entrypoint with `snapserver $EXTRA_ARGS`

If you want to use Snapcast to make your own multiroom audio setup, please check out [Mopidy-Multiroom](https://github.com/IVData/dockerfiles/tree/master/mopidy-multiroom).

## Run Snapserver
To run, use the command below, but you can change the following values:

* `1705, 1704, and 1780` the ports used by Snapserver (1780 is for the web UI). You currently can't configure the internal ports used but can change the external ones.
* `snapserver.conf` an optional Snapserver config file. If you omit this, a default config will be used (see below).
* `EXTRA_ARGS` an optional string of cmd line arguments to pass to `snapserver`.

`docker run --rm -v /tmp/snapcast:/tmp/snapcast -p 1704:1704 -p 1705:1705 -p 1780:1780 -e EXTRA_ARGS=<x> ivdata/snapserver`

## Config
You can overwrite snapcast's config by mounting a file to `/etc/snapserver.conf` in the container. The default settings create a single stream called "Snapserver" which listens on a TCP socket on port 4953 (this was previously a fifo), and enables [SnapWeb](https://github.com/badaix/snapweb) on port 1780. See the [Snapcast docs](https://github.com/badaix/snapcast/blob/master/doc/configuration.md) to create your own config.
