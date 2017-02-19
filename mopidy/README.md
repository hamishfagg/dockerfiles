# Mopidy
This is an image for the music server [Mopidy](https://github.com/mopidy/mopidy).

The image installs several extensions and use a default configuration that
allows MPD and HTTP connections from any host.

##Configure
Run the container once with `-v /some/dir:/root/.config/mopidy` and the default config file will be copied across. Then you can edit as you would with a normal Mopidy install. You can specify login details in the config file and not in environment vars if you prefer.

###Audio Output
By default this image is configured to output to a [Snapserver](https://github.com/IVData/dockerfiles/tree/master/snapserver) for use in [Mopidy-Multiroom](https://github.com/IVData/dockerfiles/tree/master/mopidy-multiroom). If you'd like to output audio to a regular device, you can edit the config file and follow the instructions inside under 'audio'.

`docker run --rm -p 6680:6680 -p 6600:6600 -e SPOTIFY_USERNAME -e SPOTIFY_PASSWORD -e GMUSIC_USERNAME -e GMUSIC_PASSWORD -v /tmp/snapcast:/tmp ivdata/mopidy`
