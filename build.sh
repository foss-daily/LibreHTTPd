#!/bin/sh
set -e

echo "Building LibreHTTPd..."

if [ ! -d "ngx-fancyindex-master" ]; then
    echo "Error: ngx-fancyindex-master not found"
    echo "Run: git clone --recurse-submodules or download fancyindex manually"
    exit 1
fi

./configure \
  --prefix=/usr/local/librehttpd \
  --sbin-path=/usr/local/bin/librehttpd \
  --conf-path=/etc/librethttpd/librehttpd.conf \
  --pid-path=/var/run/librehttpd.pid \
  --with-http_ssl_module \
  --with-http_v2_module \
  --with-http_realip_module \
  --with-http_gzip_static_module \
  --with-pcre-jit \
  --with-file-aio \
  --with-threads \
  --without-http_charset_module \
  --without-http_ssi_module \
  --without-http_userid_module \
  --without-http_auth_basic_module \
  --without-http_mirror_module \
  --without-http_autoindex_module \
  --without-http_geo_module \
  --without-http_split_clients_module \
  --without-http_referer_module \
  --without-http_fastcgi_module \
  --without-http_uwsgi_module \
  --without-http_scgi_module \
  --without-http_grpc_module \
  --without-http_memcached_module \
  --without-http_empty_gif_module \
  --without-http_browser_module \
  --without-http_upstream_ip_hash_module \
  --without-http_upstream_least_conn_module \
  --without-http_upstream_random_module \
  --with-cc-opt="-O3 -march=native -mtune=native -flto -fomit-frame-pointer -pipe -funroll-loops -ffast-math -DTCP_FASTOPEN=23" \
  --with-ld-opt="-flto -Wl,-O2 -Wl,--as-needed -Wl,--gc-sections" \
  --add-module=./ngx-fancyindex-master

echo "Compiling..."
make -j$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)
mv objs/nginx objs/librehttpd

echo ""
echo "Build complete!"
echo "Binary: objs/librehttpd"
echo ""
echo "To install: doas make install (or sudo make install)"
