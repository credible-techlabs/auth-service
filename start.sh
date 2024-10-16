#!/bin/bash
# Load environment variables from .env file
if [ -f .env ]; then
    export $(cat .env | xargs)
fi

docker run -d -p 8000:8000 --name auth-service-container --network $NETWORK_NAME auth-service:local
# docker run -d -p 8000:8000 --name auth-service-container --network network-container auth-service:local