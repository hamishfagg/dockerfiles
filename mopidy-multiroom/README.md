# Mopidy-Multiroom
A mopidy setup with multi-room audio support through snapcast.


Mopidy-Multiroom aims to provide simple multi-room audio through docker, without the hassle.  
**The music** side of things is handled by [Mopidy](https://github.com/mopidy/mopidy) - an extensible music player than can play your own music, or get music from your **Spotify** or **Google Play Music** account.  
**The multiroom** part is handled by [Snapcast](https://github.com/badaix/snapcast) - a **synchronous** multiroom music player.

Together, Mopidy-Multiroom aims to provide a simple to set up music sever for both parts above.

##Running Mopidy-Multiroom
Clone the repo and `cd` to the Mopidy-Multiroom directory:
![clone](images/cloneandcd.gif)


Edit `logins.env` and enter your username and password for the service(s) of your choice.
![logins](images/logins.gif)

Run Mopidy-Multiroom with `docker-compose up`!
![run](images/run.gif)
