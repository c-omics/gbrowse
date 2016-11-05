# GBrowse

GBrowse license: GPL

## Useful Links

 * [package web-site](https://github.com/GMOD/GBrowse)
 * [container github-site](https://github.com/sglim2/docker-bio)
 * [Docker Hub](https://hub.docker.com/u/sglim2/)

## Example Usage
See the [container github-site](https://github.com/sglim2/docker-bio) for further usage documentation.

Start the container in deamon mode
```
docker run -it -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 127.0.0.1:8080:80 sglim2/gbrowse bash
httpd
```

