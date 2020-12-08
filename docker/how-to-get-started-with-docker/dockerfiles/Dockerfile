ARG VERSION=latest
FROM azul/zulu-openjdk-debian:${VERSION}

SHELL ["/bin/bash", "-c"]

ENV FOO=/home/foo

COPY .bashrc /root
RUN source /root/.bashrc
RUN echo This is foo: $FOO
