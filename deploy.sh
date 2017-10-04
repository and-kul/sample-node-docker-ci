#!/bin/bash
docker push andkul/sample-node

ssh mr_and_kul@35.195.210.31  << EOF
docker pull andkul/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi andkul/sample-node:current || true
docker tag andkul/sample-node:latest andkul/sample-node:current
docker run -d --restart always --name web -p 80:80 andkul/sample-node:current
EOF
