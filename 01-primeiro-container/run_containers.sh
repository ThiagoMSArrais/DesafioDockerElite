#!/bin/bash

echo "Baixando a imagem do nginx"
docker pull nginx

echo "Criando o container com o nome meu-servidor utilizando a imagem nginx"
docker run -d --name meu-servidor -p 8080:80 nginx

echo "Listando todos os containers em execução"
docker container ls

echo "Removendo o container meu-servidor"
docker stop meu-servidor
docker rm meu-servidor

echo "Listando todos os containers em execução"
docker container ls