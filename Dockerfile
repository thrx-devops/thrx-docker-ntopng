FROM ubuntu:18.04
MAINTAINER ntop.org

RUN apt-get update && \
    apt-get -y -q install wget lsb-release gnupg && \
    wget -q http://apt-stable.ntop.org/18.04/all/apt-ntop-stable.deb && \
    dpkg -i apt-ntop-stable.deb && \
    apt-get clean all

RUN apt-get update && \
    apt-get -y install ntopng \
    --fix-missing

RUN echo '#!/bin/bash\n/etc/init.d/redis-server start\nntopng ${NTOPNG_OPTIONS} "$@"' > /run.sh && \
    chmod +x /run.sh

EXPOSE 3000

ENTRYPOINT ["/run.sh"]
