## Introduction

This is a Harbor docker compose stack built for docker swarm and is based on the Bitnami Harbor docker-compose, which can be found here:

- https://github.com/bitnami/bitnami-docker-harbor-registry

The stack is using nfs volumes as persistent storage as well as Traefik 2.x for ingress, which are needed to be setup separately.

## Preparation
Download the "harbor-compose.yaml" file as well as the files located in "supplementary" directory (also archived in "supplementary.tgz") and safe the files on the swarm manager node.

### Installation
Adjust the variables located in "start-stop.sh" script according to your requirements - the mandatory vars are:

- ```HARBOR_HOST```
- ```HARBOR_ADMIN_PASSWORD```

Make the scipt "start-stop.sh" executable:
```$ chmod u+x start-stop.sh```

### Startup
Launch the stack using the script:
```$ ./start-stop.sh start```

Monitor the stack using following commands (depending on situation):
```$ docker stack ps harbor```
```$ docker service ls -f name=harbor```
