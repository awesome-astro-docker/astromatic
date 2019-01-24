FROM ubuntu:18.04
RUN apt -y update && apt install -y apt-utils

RUN DEBIAN_FRONTEND=noninteractive \
    apt install -y --no-install-recommends \
    make \
    gcc \
    git \
    ca-certificates \
    autoconf \
    automake \
    libtool \
    pkg-config \
    libfftw3-dev \
    libatlas3-base \
    libatlas-base-dev \
    libplplot-dev \
    libcurl4 \
    libcurl4-openssl-dev

RUN mkdir -p /src \
    && cd /src \
    && git clone https://github.com/astromatic/sextractor.git sourceextractor \
    && cd sourceextractor \
    && sh autogen.sh \
    && ./configure \
    && make \
    && make install

RUN cd /src \
    && git clone https://github.com/astromatic/psfex.git psfex \
    && cd psfex \
    && sh autogen.sh \
    && ./configure \
    && make \
    && make install

RUN cd /src \
    && git clone https://github.com/astromatic/scamp.git scamp \
    && cd scamp \
    && sh autogen.sh \
    && ./configure \
    && make \
    && make install

    