# thrx-docker-ntopng

## thrx-ntopng
![GitHub](https://img.shields.io/github/license/thrx-devops/thrx-docker-ntopng.svg)

![Docker Pulls](https://img.shields.io/docker/pulls/thrx/thrx-ntopng.svg)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/thrx/thrx-ntopng.svg)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/thrx/thrx-ntopng.svg)

### Docker for running [ntopng](https://github.com/ntop/ntopng)

```
    docker run \ 
    --detach \
    --restart always \
    --net=host \
    --name thrx-ntopng \
    -e NTOPNG_OPTIONS="--http-prefix /ntopng" \
    -t -i \
    thrx/thrx-ntopng 
```

## Advanced usage

### NTOPNG_OPTIONS

Passing options to the nopng commandline:
https://www.ntop.org/guides/ntopng/cli_options.html

Example:
```
-e NTOPNG_OPTIONS="--http-prefix /myntopng"
```

### Reverse Proxy

add:
```
--http-prefix /ntopng
or
ntopng -Z /ntopng
```

nginx:
```
location /ntopng/ {
      auth_basic "Restricted ntopng"; #For Basic Auth
      auth_basic_user_file /etc/nginx/.htpasswd;  #For Basic Auth
      error_log /var/log/nginx/ntopng.error.log;
      proxy_pass http://192.168.1.4:3000/ntopng/;
}
```


```
http://localhost:3000/ntopng/

https://server/ntopng/
```

### Build from source code

You can build the image also from source. To do this you have to clone the
[thrx-docker-ntopng](https://github.com/thrx-devops/thrx-docker-ntopng) repository from GitHub:

```
docker build --rm --no-cache -t thrx/thrx-ntopng .
```

### Bash shell inside container

If you need a shell inside the container you can run the following command:

```
docker exec -ti ntopng /bin/sh
```
