# Snapcast Client
This is a docker image for the [snapcast client](https://github.com/badaix/snapcast).

If you want to use Snapcast to make your own multiroom audio setup, please check out [Mopidy-Multiroom](https://github.com/IVData/dockerfiles/tree/master/mopidy-multiroom).

## Run Snapclient
To run, use the command below, but you can change the following values:

* `/dev/snd` a sound device for snapclient to output sound to.
* `HOST` the hostname or IP of the snapserver.
* `EXTRA_ARGS` any other arguments you'd like to pass along to `snapclient`

`docker run --rm --device /dev/snd -e HOST=127.0.0.1 -e EXTRA_ARGS=<x> ivdata/snapclient`
