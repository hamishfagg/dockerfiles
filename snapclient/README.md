# Snapcast Client
This is a docker image for the [snapcast client](https://github.com/badaix/snapcast).

If you want to use Snapcast to make your own multiroom audio setup, please check out [Mopidy-Multiroom](https://github.com/IVData/dockerfiles/tree/master/mopidy-multiroom).

## Run Snapclient
To run, use the command below, but you can change the following values:

* `/dev/snd` a sound device for snapclient to output sound to.
* `HOST` the hostname or IP of the snapserver.

`docker run --rm --device /dev/snd -e HOST=127.0.0.1 ivdata/snapclient`

## Snapcast Updates
This dockerfile uses an argument variable for the Snapcast version. If a newer version of Snapcast is available you can rebuild this image to use it - then please let me know that Snapcast has been updated so that I can update my repo.
