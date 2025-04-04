FROM ubuntu:25.04

# Instalação das dependências
RUN apt-get update && apt-get install -y ffmpeg

# Copia o script para dentro da imagem
COPY convert.sh /app/convert.sh

# Garante permissões de execução para o script
RUN chmod +x /app/convert.sh

# Define o diretório de trabalho
WORKDIR /app

# Define o ENTRYPOINT para executar o script
ENTRYPOINT ["./convert.sh"]

# Permite passar argumentos via CMD
CMD ["-h"]