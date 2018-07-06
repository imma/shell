FROM ubuntu:bionic

VOLUME /data

ENV DEBIAN_FRONTEND noninteractive

ENTRYPOINT ["/tini", "--", "/service"]
CMD []

USER root
WORKDIR /

USER root
WORKDIR /
COPY service /service
RUN /service

USER ubuntu
WORKDIR /home/ubuntu
RUN env SERVICE_DONE=/tmp/.done-shell /service
