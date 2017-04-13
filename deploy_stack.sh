!#/bin/sh
echo "Deploying stack...";
docker stack deploy stack --compose-file docker-compose.yml
