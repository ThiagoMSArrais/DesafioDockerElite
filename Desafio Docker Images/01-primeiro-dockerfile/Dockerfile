FROM nginx:1.27.4-alpine3.21-perl

WORKDIR /app

COPY ./pagina /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]