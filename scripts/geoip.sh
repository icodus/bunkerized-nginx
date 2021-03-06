#!/bin/sh

# MMDB from https://db-ip.com/db/download/ip-to-country-lite
URL="https://download.db-ip.com/free/dbip-country-lite-$(date +%Y-%m).mmdb.gz"
wget -O /etc/nginx/geoip.mmdb.gz "$URL" > /dev/null 2>&1
if [ -f /etc/nginx/geoip.mmdb.gz ] ; then
	gunzip -f /etc/nginx/geoip.mmdb.gz
	if [ -f /run/nginx/nginx.pid ] ; then
		/usr/sbin/nginx -s reload
	fi
fi
