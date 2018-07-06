FROM ubuntu:bionic

VOLUME /data

ENV DEBIAN_FRONTEND noninteractive

USER root
WORKDIR /
COPY service /service
RUN env SERVICE_DONE=/tmp/.done-shell /service

USER ubuntu
WORKDIR /home/ubuntu
ENTRYPOINT ["/tini", "--", "/service"]
CMD []

