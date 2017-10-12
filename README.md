# orange-docker

Docker images for Orange Data Mining Suite

### Quick Setup ###

Start orange docker container and bind ports 5901 (VNC interface) and 6901 (browser interface).

```sh
    docker run -p 127.0.0.1:5901:5901 -p 127.0.0.1:6901:6901 -it acopar/orange-docker
```

### Docker-compose ###

You can also use docker-compose file instead of command line arguments:


```sh
    docker-compose up -d
```

### Connect ###

On host machine, connect to orange docker with the following url in browser:

[http://localhost:6901/?password=orange](http://localhost:6901/?password=orange)

```sh
   vncviewer localhost:5901
```

If you want to connect to orange docker remotely, create ssh tunnel on port 6901 (5901 for vnc connectivity).

```sh
    ssh user@remote -L 6901:localhost:6901 -N -f
```

Now you can connect the same way as before, for example:

[http://localhost:6901/?password=orange](http://localhost:6901/?password=orange)


### Sharing data ###

The data inside the container is not persistent. If necessarry, declare additional volume mount points. This allows file sharing between the host and the container.

```sh
    docker run -p 127.0.0.1:5901:5901 -p 127.0.0.1:6901:6901 -v datasets:/home/orange/datasets -it acopar/orange-docker
```
