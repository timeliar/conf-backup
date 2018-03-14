#!/bin/bash
# define CONST
BASE_DIR=/data/src

NGINX_V=nginx-1.13.4
PCRE_V=pcre-8.41
ZLIB_V=zlib-1.2.11
FANCY_INDEX_V=ngx-fancyindex
LUA_MODULE=lua-nginx-module-0.10.10
LUAJIT_V=LuaJIT-2.0.5

NGINX_DIR=$BASE_DIR/$NGINX_V
# install dependency
apt install wget git gcc g++ make cmake unzip openssl libssl-dev
# dnf install wget git gcc g++ make cmake unzip openssl libssl-dev

# make base src dir
mkdir -p $BASE_DIR
cd $BASE_DIR

# download source files
if [ ! -d "$BASE_DIR/$ZLIB_V" ]; then
	wget "http://zlib.net/$ZLIB_V.tar.gz"
	tar -zvxf $ZLIB_V.tar.gz
fi
if [ ! -d "$BASE_DIR/$PCRE_V" ]; then
		wget "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/$PCRE_V.zip"
		unzip $PCRE_V.zip
fi
if [ ! -d "$BASE_DIR/$NGINX_V" ]; then
		wget "http://nginx.org/download/$NGINX_V.tar.gz"
		tar -zvxf $NGINX_V.tar.gz
fi
# configure
cd $NGINX_DIR

./configure \
	--with-http_ssl_module \
	--with-http_v2_module \
    --with-pcre=../$PCRE_V \
    --with-zlib=../$ZLIB_V \
    --sbin-path=/usr/local/nginx/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --pid-path=/usr/local/nginx/nginx.pid

# make 
make && make install
