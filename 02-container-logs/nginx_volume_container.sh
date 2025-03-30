#!/bin/bash

echo "Criando um volume Docker chamado nginx_logs"
docker volume create nginx_logs

echo "Executando um contêiner nginx, montando o volume nginx_logs no diretorio /var/log/nginx do container"
docker run -d --name meu-servidor -v nginx_logs:/var/log/nginx -p 8080:80 -e NGINX_LOG_TO_VOLUME=1 nginx:1.27.4-alpine-perl
sleep 4

if docker ps | grep -q meu-servidor; then
    echo "O contêiner nginx está em execução."
else
    echo "O contêiner nginx não está em execução."
fi

echo "Gerando logs de acesso a página hospedada no nginx"
curl http://localhost:8080
sleep 2

echo "Parando e removendo o contêiner meu-servidor"
docker stop meu-servidor
docker container rm meu-servidor

echo "Criando um novo contêiner meu-servidor e validar os logs antigos ainda existem"
docker run -d --name meu-servidor -v nginx_logs:/var/log/nginx -p 8080:80 -e NGINX_LOG_TO_VOLUME=1 nginx:1.27.4-alpine-perl
sleep 4
docker exec meu-servidor ls -l /var/log/nginx
docker exec meu-servidor cat /var/log/nginx/access.log

