#!/bin/bash

p=$(pwd)

wget 'http://nginx.org/download/nginx-1.20.2.tar.gz'
tar -xzvf nginx-1.20.2.tar.gz

mkdir nginx-proxy-patch
cd nginx-proxy-patch

wget 'https://raw.githubusercontent.com/yaoweibin/nginx_tcp_proxy_module/master/tcp.patch'
cd ..

cd nginx-1.20.2/
patch -p1 < "$p/nginx-proxy-patch/tcp.patch"

./configure --add-module="$p/ngninx-proxy-patch/tcp.patch"

make
make install
