FROM resin/rpi-raspbian

#COPY ./*.sh /usr/src/app/
#RUN chmod +x /usr/src/app/*.sh

#Install depadencies

RUN apt update && apt install -y --no-install-recommends \
ca-certificates \
apt-transport-https \
build-essential


WORKDIR /usr/src/app/


RUN /usr/src/app/download.sh "%%BALENA_ARCH%%"

RUN dpkg -i /tmp/squid.deb && rm /tmp/squid.deb


RUN update-rc.d squid3 enable



#cp file configuration

COPY ./squid.conf /usr/src/app/squid3/

CMD ["service","squid3","restart"]
