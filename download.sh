#!/bin/sh

outfile="/tmp/squid.deb"
download_base="http://cdn-fastly.deb.debian.org/debian/pool/main/s/squid/"
case $1 in
   rpi)  package_file="squid-cgi_4.10-1_armhf.deb"
       ;;
   aarch64) package_file="squid-cgi_4.9-2_arm64.deb"
       ;;
   *) package_file="squid-cgi_4.10-1_armhf.deb"
esac
wget -O "${outfile}" "${download_base}${package_file}"
