This is an image for the music server Mopidy (https://www.mopidy.com/).

The image installs several extensions and use a default configuration that
allows MPD and HTTP connections from any host.

This container is intended to be used with snapcast, and is set up that way by default.
Mount a folder to /root/.config/mopidy and the container will copy the config there when run so that you can edit it.

Pass ENV vars SPOTIFY_USERNAME, SPOTIFY_PASSWORD, GMUSIC_USERNAME, and GMUSIC_PASSWORD to enable and use Mopidy's Spotify and/or Google Play Music extensions.
