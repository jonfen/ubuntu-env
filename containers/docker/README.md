# Docker 

## Install ##

```
./install-docker.sh
./install-docker-compose.sh
./install-credential-store.sh
./install-docker-machine.sh
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

### Test the running container once
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

### Service (AKA multi-container application)
Create docker-compose.yml
```
# Remove the app
$ docker stack rm getstartedlab

# Take down the swarm
$ docker swarm leave --force

# Create the swarm
$ docker swarm init

# You can scale the app by changing the replicas value in docker-compose.yml, saving the change, and re-running:
$ docker stack deploy -c docker-compose.yml [LOAD-BALANCED-APP-NAME]

# list the services
$ docker service ls
$ docker service ps [LOAD-BALANCED-APP-NAME]

```

### Swarm Cluster (AKA multi-machine, multi-container application)
A swarm cluster is made up of 'nodes'.  There are two types of nodes, 'Managers' and 'Workers'.
`Managers`:
* can execute docker commands
* control distribution and execution of your normal docker commands to the cluster `nodes`.
* authorize machines to join swarm as `workers`.
* Swarm Manager Strategies:
** `emptiest node`: fill the least utilized machine with containers
** `global`: each machine gets exactly one instance of a specified container.
`Workers`:
* just for capacity
* no processes running on it or authority like a manager. 
```
# Create multiple machines
$ sudo apt -y install virtualbox
$ docker-machine create --driver virtualbox myvm1
$ docker-machine create --driver virtualbox myvm2
```

## Option: 1 (requires cut and paste)
```
# Get their IP Addresses
$ docker-machine ls

# Define myvm1 as a Manager
$ docker-machine ssh myvm1 "docker swarm init --advertise-addr [myvm1 ip]"

# Add another manager to the swarm
$ docker swarm join-token manager

# Define myvm2 as a Worker (using the output of adding myvmq as a Manager)
$ docker-machine ssh myvm2 "docker swarm join --token SWMTKN-1-2wjhw4ifmigp807bmzmp33a9ywel609ni6352i4detqsgbs3mr-a0022lxknhs1du1c5hiwg1hc3 192.168.99.100:2377"

# View nodes in the swarm (only on a manager)
$ docker-machine ssh myvm1 "docker node ls"

# Remove node from swarm
$ docker-machine ssh myvm2 "docker swarm leave"
```

## Option: 2 (scriptable)
```
# Dump of configuration for shell to talk to myvm1
$ docker-machine env myvm1

# Execute it
$ eval $(docker-machine env myvm1)


```

## References ##

[Docker Get-Started](https://docs.docker.com/get-started/)

```
## List Docker CLI commands
$ docker
$ docker container --help

## Display Docker version and info
$ docker --version
$ docker version
$ docker info

## Execute Docker image
$ docker run hello-world

## List Docker images
$ docker image ls

## List Docker containers (running, all, all in quiet mode)
$ docker container ls
$ docker container ls --all
$ docker container ls -aq

$ docker build -t friendlyhello .  # Create image using this directory's Dockerfile
$ docker run -p 4000:80 friendlyhello  # Run "friendlyhello" mapping port 4000 to 80
$ docker run -d -p 4000:80 friendlyhello         # Same thing, but in detached mode
$ docker container ls                                # List all running containers
$ docker container ls -a             # List all containers, even those not running
$ docker container stop <hash>           # Gracefully stop the specified container
$ docker container kill <hash>         # Force shutdown of the specified container
$ docker container rm <hash>        # Remove specified container from this machine
$ docker container rm $(docker container ls -a -q)         # Remove all containers
$ docker image ls -a                             # List all images on this machine
$ docker image rm <image id>            # Remove specified image from this machine
$ docker image rm $(docker image ls -a -q)   # Remove all images from this machine
$ docker login             # Log in this CLI session using your Docker credentials
$ docker tag <image> username/repository:tag  # Tag <image> for upload to registry
$ docker push username/repository:tag            # Upload tagged image to registry
$ docker run username/repository:tag                   # Run image from a registry

$ docker stack ls                                            # List stacks or apps
$ docker stack deploy -c <composefile> <appname>  # Run the specified Compose file
$ docker service ls                 # List running services associated with an app
$ docker service ps <service>                  # List tasks associated with an app
$ docker inspect <task or container>                   # Inspect task or container
$ docker container ls -q                                      # List container IDs
$ docker stack rm <appname>                             # Tear down an application
$ docker swarm leave --force      # Take down a single node swarm from the manager
```
