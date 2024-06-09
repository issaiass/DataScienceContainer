#!/bin/bash

# Prune Docker images
docker image prune $(docker images --filter "dangling=true" -q)
echo "Docker dangling images pruned successfully!"

docker image prune $(docker images --filter "status=exited" -q)
echo "Docker exited images pruned successfully!"