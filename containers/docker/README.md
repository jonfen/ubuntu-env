# Docker 

## Install ##

```
./install-docker.sh
./install-docker-compose.sh
./install-credential-store.sh
```

## Quick Reference ##


### Display Docker version and info
```
$ docker
$ docker --version
$ docker version
$ docker info
```

### Credentials 
```
$ docker login [REGISTRY]
$ docker logout
```

### Credentials: use LastPass cli to login
```
$ lpass show --url 'hub.docker.com' --password | docker login --username $(lpass show --url 'hub.docker.com' --username) --password-stdin
```

### Images
```
$ docker image ls -a
$ docker rmi -f [IMAGE ID] 
```

### Tag an Image
```
docker tag [CONTAINER NAME] username/repository:tag
$ docker tag friendlyhello $(lpass show --url 'hub.docker.com' --username)/get-started:part2
```

### Publish image to Registry
```
$ docker push username/repository:tag
```

### Build [the Dockerfile]
```
$ docker build --tag=[CONTAINER NAME] --network=host . 
```

### Run [container in background]
```
$ docker run -d -p 4000:80 [CONTAINER NAME]
```

### Run [...and from a registry]
```
$ docker run -d -p 4000:80 username/repository:tag
```

### View stdout 
```
$ docker attach [CONTAINER ID]
```

### Test Running Container
```
$ curl http://localhost:4000
```

### Containers (AKA runtime instances of an Image)
```
$ docker container ls
$ docker container ls -a  
$ docker container ls -aq
$ docker container stop [CONTAINER ID]
$ docker rm -f [CONTAINER ID] 
```

### SSH (kinda)
```
$ docker exec -it [CONTAINER ID] bash
```

### Cleanup
```
$ docker system prune
```

## References ##

[Docker Get-Started](https://docs.docker.com/get-started/)
