# Docker 


## Quick Reference ##

```
## Display Docker version and info
docker
docker --version
docker version
docker info

## Images
docker image ls -a
docker rmi -f [IMAGE ID] 

## Containers (runtime instances of an Image)
docker container ls
docker container ls -a  
docker container ls -aq
docker rm -f [CONTAINER ID] 

## Execute Docker image
docker run hello-world

```

## References ##

[Docker Get-Started](https://docs.docker.com/get-started/)
