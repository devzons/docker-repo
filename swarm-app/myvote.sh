docker network create --driver overlay frontend
docker network create --driver overlay backend

docker service create --name vote --network frontend -p 80:80 --replicas 2 bretfisher/examplevotingapp_vote

docker service create --name redis --network frontend --replicas 2 redis:6-alpine

docker service create --name worker --network frontend --network backend --replicas 1 bretfisher/exmaplevotingapp_worker:java

docker service create --name db --network backend -e POSTGRES_HOST_AUTH_METHOD=trust --mount type=volume,source=db-data,target=/var/lib/postgresql/data postgres:13-alpine

docker service create --name result --network backend -p 5001:80 bretfisher/examplevotingapp_result