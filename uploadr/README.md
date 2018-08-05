# XMPP Uploadr

Send a http POST request to this container, port 8080, to upload a file to xmpp.
Post data should include:

* notify: The JID of the persion to notify with the file
* url: The url of the file to upload

You need to mount your .uploadrc file to /root/.uploadrc as described here: https://github.com/sezuan/uploadr

`docker run --rm -it -p 8080:8080 -v /path/to/.uploadrc:/root/.uploadrc ivdata/xmpp-uploadr`

upload e.g.: 

`curl -d "url=http://localhost/picture.jpg&notify=me@example.com" -X POST localhost:8080`
