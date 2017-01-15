This is an image for the snapcast server (https://github.com/badaix/snapcast).

The server reads from the default named pipe at /tmp/snapfifo. To make this pipe shared with other processes, one can use a host directory mounted as a data volume:
`docker run --rm -v /tmp/snapcast:/tmp -p 1704:1704 -p 1705:1705 snapserver`


