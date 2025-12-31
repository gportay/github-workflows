FROM debian:trixie
ENV DPKG_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential \
                                               devscripts \
                                               debhelper 
RUN apt-get update && \
    apt-get install -y --no-install-recommends git \
                                               sudo \
                                               vim
