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
  --with-http_v3_module \
  --with-http_realip_module \
  --with-http_gzip_static_module \
  --with-http_gunzip_module \
  --with-http_slice_module \
  --with-http_stub_status_module \
  --with-http_sub_module \
  --with-stream \
  --with-stream_ssl_module \
  --with-stream_realip_module \
  --with-pcre-jit \
  --with-file-aio \
  --with-threads \
  --without-http_charset_module \
  --without-http_ssi_module \
  --without-http_userid_module \
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
  --with-cc-opt="-march=native -O3 -pipe -fno-plt -fexceptions \
    -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security \
    -fstack-clash-protection -fcf-protection \
    -flto=auto" \
  --with-ld-opt="-Wl,-O1 -Wl,--sort-common -Wl,--as-needed \
    -Wl,-z,relro -Wl,-z,now -Wl,-z,pack-relative-relocs \
    -flto=auto" \
  --add-module=./ngx-fancyindex-master

echo "Compiling..."
make -j$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)
mv objs/nginx objs/librehttpd

echo ""
echo "Build complete!"
echo "Binary: objs/librehttpd"
echo ""
echo "To install: doas make install (or sudo make install)"
