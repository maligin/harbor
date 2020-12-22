#!/bin/sh

export STACK="harbor"

# change-me
export HARBOR_HOST="harbor.myfqdn.domain"
export HARBOR_ADMIN_PASSWORD="Harbor12345"
export NFS_HOST="10.10.1.13"
export NFS_SHARE=":/mnt/tank/data/dkr/sys30/harbor"

# default settings (if changing the postgres pw and user, also adjust the supplementary/clair/config.yaml on the line nr. 5)
export REGISTRY_HTTP_SECRET="harbor"
export CORE_SECRET="harbor"
export JOBSERVICE_SECRET="harbor"
export POSTGRESQL_USERNAME="postgres"
export POSTGRESQL_PASSWORD="bitnami"
export POSTGRESQL_DATABASE="registry"
export HARBOR_ADMIN_PASSWORD="Harbor12345"
export HARBOR_TAG="2-debian-10"
export PSQL_TAG="11-debian-10"
export REDIS_TAG="6.0-debian-10"
export NGINX_TAG="1.19-debian-10"
export CHARTMUSEUM_TAG="0-debian-10"
export CORE_KEY="harbor"

start() { 
  docker stack deploy -c $STACK-compose.yaml $STACK
}

stop() {
  docker stack rm $STACK
}

case $1 in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    sleep 10
    start
    ;;
  *)
    echo "Usage: $0 (start|stop|restart)"
    exit 127
    ;;
esac
