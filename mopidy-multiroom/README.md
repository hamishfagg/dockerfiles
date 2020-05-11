# Mopidy-Multiroom
A mopidy setup with multi-room audio support through snapcast.


Mopidy-Multiroom aims to provide simple multi-room audio through docker, without the hassle.  
**The music** side of things is handled by [Mopidy](https://github.com/mopidy/mopidy) - an extensible music player than can play your own music, or get music from your **Spotify** or **Google Play Music** account.  
**The multiroom** part is handled by [Snapcast](https://github.com/badaix/snapcast) - a **synchronous** multiroom music player.

Together, Mopidy-Multiroom aims to provide a simple to set up music sever for both parts above.

## Running Mopidy-Multiroom
1. Clone the repo and `cd` to the Mopidy-Multiroom directory:  
`git clone https://github.com/IVData/dockerfiles && cd dockerfiles/mopidy-multiroom`

2. Create a symlink or put your music in the music folder (or don't, if you plan to use Spotify or Google Play Music).

3. Run Mopidy-Multiroom with `docker-compose up`! That's it!

If you want to alter the mopidy config to enable Spotify or Google Play Music for example, the config will now be in the mopidydata folder.


## Connect Clients
You can now connect any Snapcast client you'd like. For convenience I have a dockerfile for a [snapcast client](https://github.com/IVData/dockerfiles/tree/master/snapclient) in this repo. You can also connect to your snapserver through the web interface at `http://<your-server-ip>:1780` or download the Snapcast [Android client](https://play.google.com/store/apps/details?id=de.badaix.snapcast&hl=en) which is really useful for testing and adjusting latencies.

## Play Music
Mopidy-Multiroom comes with a fully featured UI called [Iris](https://mopidy.com/ext/iris/) which will be available at:  
`http://<your-server-ip>:6680/iris`. You'll need to run a local scan in the Iris settings if you've added local music.

## Changing More Mopidy or Snapcast Options
In order to configure either Mopidy or Snapcast more, you'll need to install and run both of my containers separately in docker. Visit the respective readmes for [Mopidy](https://github.com/IVData/dockerfiles/tree/master/mopidy) and [Snapserver](https://github.com/IVData/dockerfiles/tree/master/snapserver) to get hacking!
