FROM node:8

ENV http_proxy http://proxy.rd.franctelecom.fr:8080
ENV https_proxy http://proxy.rd.franctelecom.fr:8080

RUN apt-get update && \
    apt-get install snapd

RUN snap install firefox

USER node
