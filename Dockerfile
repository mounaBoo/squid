FROM resin/rpi-raspbian

#COPY ./*.sh /usr/src/app/
#RUN chmod +x /usr/src/app/*.sh

#Install depadencies

RUN apt update && apt install -y --no-install-recommends \
ca-certificates \
apt-transport-https \
build-essential


WORKDIR /usr/src/app/

RUN sudo apt install http://cdn-fastly.deb.debian.org/debian/pool/main/s/squid/squid-cgi_4.10-1_armhf.deb

RUN sudo dpkg -i squid-cgi_4.10-1_armhf.deb


#cp file configuration

COPY ./squid.conf /usr/src/app/squid/

CMD ["service","squid","restart"]
