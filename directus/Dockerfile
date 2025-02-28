FROM --platform=linux/amd64 directus/directus:latest

USER root

RUN apk update && apk add curl && apk add ca-certificates
RUN curl -o /etc/ssl/certs/global-bundle.pem https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem

RUN update-ca-certificates
