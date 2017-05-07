# Snapcast Server
This is a docker image for the [snapcast server](https://github.com/badaix/snapcast).

If you want to use Snapcast to make your own multiroom audio setup, please check out [Mopidy-Multiroom](https://github.com/IVData/dockerfiles/tree/master/mopidy-multiroom).

## Run Snapserver
To run, use the command below, but you can change the following values:

* `/tmp/snapcast` a temporary directory for Snapcast to create it's fifo inside.
* `1705 and 1704` the ports used by Snapserver. You currently can't configure the internal ports used but can change the external ones.

`docker run --rm -v /tmp/snapcast:/tmp -p 1704:1704 -p 1705:1705 ivdata/snapserver`

## Snapcast Updates
This dockerfile uses an environment variable for the Snapcast version. If a newer version of Snapcast is available you can rebuild this image to use it - then please let me know that Snapcast has been updated.
