# Orange docker

Docker image for Orange Data Mining Suite.

## Dependencies ##

- [docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-docker-ce).


## Quick Setup ##

Start orange docker container and bind ports 5901 (VNC interface) and 6901 (browser interface).

```sh
    docker run -p 127.0.0.1:5901:5901 -p 127.0.0.1:6901:6901 -it acopar/orange-docker
```

### Connect ###

On host machine, connect to orange docker with the following url in browser:

[http://localhost:6901/](http://localhost:6901/)

```sh
   vncviewer localhost:5901
```

If you want to connect to orange docker remotely, create ssh tunnel on port 6901 (5901 for vnc connectivity).

```sh
    ssh user@remote -L 6901:localhost:6901 -N -f
```

Now you can connect to the remote session via browser [http://localhost:6901/](http://localhost:6901/) or via VNC:

```sh
    ssh user@remote -L 5901:localhost:5901 -N -f
    vncviewer localhost:5901
```

## Sharing data ##

The data inside the container is not persistent. If necessarry, declare additional volume mount points. This allows file sharing between the host and the container.

```sh
    docker run -p 127.0.0.1:5901:5901 -p 127.0.0.1:6901:6901 -v datasets:/home/orange/datasets -it acopar/orange-docker
```
