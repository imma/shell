FROM ubuntu:bionic

VOLUME /data

ENV DEBIAN_FRONTEND noninteractive

USER root
WORKDIR /
COPY service /service
COPY data /data
RUN env SERVICE_DONE=/tmp/.done-shell /service
RUN rm -rf /data || true
RUN chown ubuntu:ubuntu /data

USER ubuntu
WORKDIR /home/ubuntu
ENTRYPOINT ["/tini", "--", "/service"]
CMD []
