#TO BUILD: docker build -t tlsassistant-testbed .
#TO RUN: docker run -p 9000-9010:9000-9010 -t tlsassistant-testbed

FROM ubuntu:18.04

ENV RUNNING_IN_DOCKER=true

RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    libpcre3 \
    libpcre3-dev \
    zlib1g \
    zlib1g-dev \
    libssl-dev \
    libgd-dev \
    libxml2 \
    libxml2-dev \
    uuid-dev \
    git \
    aha \
    html2text \
    libxml2-utils \
    pandoc \
    dos2unix \
    libexpat1-dev \
    && rm -rf /var/lib/apt/lists/*

# the packages below are only required if the DamnVulnerableOpenSSL Docker path
# in prepare.sh is re-enabled.
#    docker.io \
#    python-pip \
# && pip install --pre tlslite-ng

WORKDIR /tlsassistant-testbed

COPY ./configs /tlsassistant-testbed/configs
COPY ./dependencies /tlsassistant-testbed/dependencies
COPY ./doc /tlsassistant-testbed/doc
COPY ./prepare.sh /tlsassistant-testbed/prepare.sh
COPY ./run.sh /tlsassistant-testbed/run.sh

RUN chmod +x /tlsassistant-testbed/prepare.sh
RUN chmod +x /tlsassistant-testbed/run.sh

RUN /tlsassistant-testbed/prepare.sh

EXPOSE 9000-9010

CMD ["bash", "/tlsassistant-testbed/run.sh"]
