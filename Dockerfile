FROM alpine:latest

RUN apk add --no-cache openssl

COPY scripts /scripts

ENV CERT_COUNTRY="US"
ENV CERT_STATE="Unknown"
ENV CERT_LOCALITY="Unknown"
ENV CERT_ORG="Unknown"
ENV CA_COMMON_NAME="Private Root CA"

WORKDIR /scripts