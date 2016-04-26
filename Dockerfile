# --------------------------------------------------------------------
# | Usage Rec:
# |  
# |   Mount a folder within container then use server file name as
# |   docker run command
# | 
# | Volume: /data
# |

FROM ubuntu:latest

MAINTAINER Payam Naderi <naderi.payam@gmail.com>

RUN apt-get update \
    && apt-get install -y --force-yes \ 
       git \ 
       wget \
       xz-utils \
    && cd / && wget https://nodejs.org/dist/v5.11.0/node-v5.11.0-linux-x64.tar.xz -O nodejs.tar.xz

RUN mkdir /node && tar -xvf nodejs.tar.xz --strip-components=1 -C /node \
       && mkdir /node/etc && echo 'prefix=/usr/local' > /node/etc/npmrc \
       && ln -s /node/bin/node /usr/local/bin/node && ln -s /node/bin/npm /usr/local/bin/npm \
    && mkdir /data \
    && apt-get autoclean && rm /nodejs.tar.xz && rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME /data

CMD ["-v"]
ENTRYPOINT ["node"]

