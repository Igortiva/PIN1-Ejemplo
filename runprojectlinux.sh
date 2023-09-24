#!/bin/bash
echo "Deploy jenkins on port 8080...."
sudo docker-compose up -d
echoz "Deploy docker register..."
sudo docker run -d -p 5000:5000 --name registry --network PI1Group1 -v PI1Group1:/var/lib/registry registry:2
echo "Open Jenkins..."
xdg-open http://localhost:8080