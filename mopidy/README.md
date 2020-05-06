# Mopidy
This is an image for the music server [Mopidy](https://github.com/mopidy/mopidy).

The image uses a default configuration that
allows MPD and HTTP connections from any host.

## Configure
Run the container once with `-v /some/dir:/mopidy` and the default config file will be copied across. Then you can edit as you would with a normal Mopidy install.
All Mopidy data is also stored in this folder for ease of updating.

## Installing Mopidy Extensions
By default this image contains backend extensions for TuneIn, GMusic, and Spotify, as well as the frontend Iris, all from pip. You can specify which extra apt and pip packages you want to install though, with the `APT_PACKAGES` and `PIP_PACKAGES` env vars. You should set these to space-delimited lists of packages you want installed in the container. Upon boot, the container will make sure these packages are installed.

## Updating Mopidy / Extensions
If you specify the `UPDATE` env var (set it to anything) the container will update **all** apt and pip packages before starting (including system packages).

## Audio Output
By default this image is configured to output to a [Snapserver](https://github.com/IVData/dockerfiles/tree/master/snapserver) for use in [Mopidy-Multiroom](https://github.com/IVData/dockerfiles/tree/master/mopidy-multiroom). If you'd like to output audio to a regular device, you can edit the config file and follow the instructions inside under 'audio'.


`docker run --rm -p 6680:6680 -p 6600:6600 -v /tmp/snapcast:/tmp/snapcast -v /mopidy/data/folder:/mopidy ivdata/mopidy`
