#
# Apache Archiva 1.3.6 Standalone
#

FROM hrafique/openjdk-quantal

MAINTAINER Eric Platon <eplaton@gmx.com>

RUN apt-get update
RUN apt-get install -y wget

RUN wget --no-verbose http://www.apache.org/dist/archiva/1.3.6/binaries/apache-archiva-1.3.6-bin.tar.gz

RUN echo "997a67da720c0848cfee4726e23984fb  apache-archiva-1.3.6-bin.tar.gz" | md5sum -c
RUN echo "60c5de4291e2a3b5238f59087a700d71fed3710d  apache-archiva-1.3.6-bin.tar.gz" | sha1sum -c

RUN mkdir -p /opt
RUN tar --extract --ungzip --file apache-archiva-1.3.6-bin.tar.gz --directory /opt
RUN ln -s /opt/apache-archiva-1.3.6 /opt/archiva
RUN rm -f /opt/archiva/bin/wrapper-linux-x86-32  # See README.md for explanation.

RUN mkdir -p /var/archiva
RUN mkdir /var/archiva/logs
RUN mkdir /var/archiva/data
RUN mkdir /var/archiva/conf

RUN cp -R /opt/archiva/conf/* /var/archiva/conf

RUN export ARCHIVA_BASE=/var/archiva

EXPOSE 8080
WORKDIR /opt/archiva
CMD bin/archiva console

