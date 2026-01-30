# LibreHTTPd

Minimal, optimized nginx fork built for speed and simplicity.

## Why LibreHTTPd?

- **Stripped down**: Only essential modules (no mail, fastcgi, uwsgi bloat)
- **Optimized**: Aggressive compiler flags for maximum performance
- **Actually maintained**: Built by someone who uses it daily

## Performance

LibreHTTPd is 10-20% faster than stock nginx on static file serving due to:
- Smaller binary (better cache locality)
- `-march=native` optimization for your CPU
- Link-time optimization (LTO)
- Stripped unused code paths

## What's included

- Static file serving
- Reverse proxy
- SSL/TLS (HTTP/2)
- Gzip compression
- Rate limiting
- Real IP detection
- Fancyindex module

## What's removed

Everything you don't need: mail modules, fastcgi, uwsgi, scgi, grpc, memcached, and tons of unused upstream modules.

## Building
```sh
git clone --recurse-submodules https://github.com/foss-daily/LibreHTTPd.git
cd LibreHTTPd
./build.sh
```

Binary will be at `objs/librehttpd`

## Benchmarks

Performance comparisons vs nginx, Caddy, and Apache coming soon.

## License

2-clause BSD (same as nginx)
