#!/bin/bash

set -e

DIR=app/src/main/assets/sing-box
rm -rf $DIR
mkdir -p $DIR
cd $DIR

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

####
curl -fLSsO https://github.com/SagerNet/sing-geoip/releases/latest/download/geoip.db || curl -fLSsO https://github.com/soffchen/sing-geoip/releases/latest/download/geoip.db
xz -9 geoip.db
echo -n "latest" > geoip.version.txt

####
curl -fLSsO https://github.com/SagerNet/sing-geosite/releases/latest/download/geosite.db || curl -fLSsO https://github.com/soffchen/sing-geosite/releases/latest/download/geosite.db
xz -9 geosite.db
echo -n "latest" > geosite.version.txt
