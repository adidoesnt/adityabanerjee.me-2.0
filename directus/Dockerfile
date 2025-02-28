FROM directus/directus:latest

USER root

RUN apk update && apk add curl
RUN curl -o global-bundle.pem https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem
