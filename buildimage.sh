#!/bin/bash

# Construir la imagen
sudo docker build -t app1:latest .

# Etiquetar la imagen
sudo docker image tag app1:latest

# Empujar la imagen etiquetada a tu registro
sudo docker push localhost:5000/app1
