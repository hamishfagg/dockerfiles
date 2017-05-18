# Mopidy-Multiroom
A mopidy setup with multi-room audio support through snapcast.


Mopidy-Multiroom aims to provide simple multi-room audio through docker, without the hassle.  
**The music** side of things is handled by [Mopidy](https://github.com/mopidy/mopidy) - an extensible music player than can play your own music, or get music from your **Spotify** or **Google Play Music** account.  
**The multiroom** part is handled by [Snapcast](https://github.com/badaix/snapcast) - a **synchronous** multiroom music player.

Together, Mopidy-Multiroom aims to provide a simple to set up music sever for both parts above.

## Running Mopidy-Multiroom
1. Clone the repo and `cd` to the Mopidy-Multiroom directory:  
`git clone https://github.com/IVData/dockerfiles && cd dockerfiles/mopidy-multiroom`

2. Edit `logins.env` and enter your username and password for the service(s) of your choice.

3. Run Mopidy-Multiroom with `docker-compose up`!

It's this easy:

![install](images/install.gif)

(Don't worry about the end of file errors - that's just snapcast saying that there's nothing playing).

## Add Your Own Music Collection
If you'd like, you dont have to use any music service at all. Just create a symlink to your collection called "music" in the Mopidy-Multiroom folder:  
`ln -s /path/to/my/music music`


## Connect Clients
You can now connect any Snapcast client you'd like. For convenience I have dockerfiles for a normal [snapcast client](https://github.com/IVData/dockerfiles/tree/master/snapclient) and a [r-pi client](https://github.com/IVData/dockerfiles/tree/master/rpi-snapclient) in this repo. You can also download the Snapcast [Android client](https://github.com/badaix/snapcast/releases/latest) which is really useful for testing and adjusting latencies.

## Play Music
Mopidy-Multiroom comes with two web-UIs installed.  
A fully featured UI call [Moped](https://github.com/martijnboland/moped) will be available at:  
`http://<your-server-ip>:6680/moped`  

Another simple UI is installed called [Mopidy-Party](https://github.com/Lesterpig/mopidy-party) which is great for collaborative partying! Mopidy-Party will be available at:  
`http://<your-server-ip>:6680/party`


## Changing More Mopidy or Snapcast Options
In order to configure either Mopidy or Snapcast more, you'll need to install and run both of my containers separately in docker. Visit the respective readmes for [Mopidy](https://github.com/IVData/dockerfiles/tree/master/mopidy) and [Snapserver](https://github.com/IVData/dockerfiles/tree/master/snapserver) to get hacking!
