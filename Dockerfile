FROM debian:jessie
MAINTAINER Michael J. Stealey <stealey@renci.org>

# explicitly set user/group IDs for docker worker
RUN groupadd -r worker --gid=999 \
    && useradd -m -g worker --uid=999 worker

# Install gosu
ENV GOSU_VERSION 1.9
RUN set -x \
    && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget \
    && rm -rf /var/lib/apt/lists/* \
    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && apt-get purge -y --auto-remove ca-certificates wget

# Install MODFLOW
RUN set -x \
    && apt-get update && apt-get install -y --no-install-recommends make unzip wget gfortran \
    && rm -rf /var/lib/apt/lists/* \
    && wget http://water.usgs.gov/ogw/modflow/MODFLOW-2005_v1.11.00/mf2005v1_11_00_unix.zip \
    && unzip mf2005v1_11_00_unix.zip \
    && rm mf2005v1_11_00_unix.zip
WORKDIR /Unix/src
RUN sed -i 's/F90= f90/F90= gfortran/g' makefile \
    && sed -i "s!DATA ACCESS/'SEQUENTIAL'/!DATA ACCESS/'STREAM'/!g" /Unix/src/openspec.inc \
    && sed -i "s!DATA FORM/'BINARY'/!DATA FORM/'UNFORMATTED'/!g" /Unix/src/openspec.inc \
    && make -f makefile \
    && ln -s /Unix/src/mf2005 /usr/local/bin/mf2005 \
    && apt-get purge -y --auto-remove make unzip wget

COPY docker-entrypoint.sh /
RUN mkdir /workspace \
    && chown worker:worker -R /workspace \
    && chown worker:worker -R /Unix/test-run
WORKDIR /workspace

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/workspace"]
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["mf2005"]