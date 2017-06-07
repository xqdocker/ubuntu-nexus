FROM xqdocker/ubuntu-openjdk:8
MAINTAINER Xiaoqi Cao <thomascxq@gmail.com>

# Configure nexus variable
ENV NEXUS_VERSION=3.3.1-01 \
    NEXUS_HOME=/opt/sonatype/nexus \
    NEXUS_DATA=/nexus-data \
    SONATYPE_WORK=/opt/sonatype/sonatype-work

# Install tools
RUN apt-get update \
    && apt-get -y install \
        curl \
        tar \
    && rm -rf /var/lib/apt/lists/*

# Install Nexus
RUN mkdir -p ${NEXUS_HOME} \
    && curl --fail --silent --location --retry 3 https://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz \
    | gunzip \
    | tar x -C ${NEXUS_HOME} --strip-components=1 nexus-${NEXUS_VERSION}

RUN mkdir -p ${NEXUS_DATA}/etc ${NEXUS_DATA}/log ${NEXUS_DATA}/tmp ${SONATYPE_WORK} \
    && ln -s ${NEXUS_DATA} ${SONATYPE_WORK}/nexus3

VOLUME ${NEXUS_DATA}

EXPOSE 8081
WORKDIR ${NEXUS_HOME}

CMD ["bin/nexus", "run"]
