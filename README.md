# LibreHTTPd

Minimal nginx fork. No bloat, just what you need.

## Why?

nginx is great but comes with everything. LibreHTTPd strips it down to essentials:

- **No mail server modules** - you're not running a mail server
- **No fastcgi/uwsgi/scgi** - modern apps don't need this
- **No corporate bloat** - built by someone who actually uses it
- **Your modules only** - static files, proxy, SSL, that's it

## Philosophy

- **Libre**: Free as in freedom, no corporate control
- **Minimal**: Only what's needed, nothing more
- **Transparent**: You can read and understand the entire config
- **DIY**: Built for self-hosters who want control

## What's included

- Static file serving
- Reverse proxy
- SSL/TLS (HTTP/2, HTTP/3)
- Gzip compression
- Rate limiting
- Fancyindex (directory listings)

## What's removed

Mail modules, fastcgi, uwsgi, scgi, grpc, memcached, and dozens of unused upstream modules you'll never touch.

## Building

```sh
git clone --recurse-submodules https://github.com/foss-daily/LibreHTTPd.git
cd LibreHTTPd
./build.sh
```

Binary will be at `objs/librehttpd`

## Who is this for?

- Self-hosters running personal sites
- People who hate unnecessary complexity
- Anyone tired of configuring modules they don't use
- Homelab enthusiasts
- FreeBSD users (optimized but works everywhere)

## Not for you if

- You need fastcgi/PHP-FPM
- You run a mail server through nginx
- You want "just works" with zero config (use Caddy)
- You need enterprise support

## License

2-clause BSD (same as nginx)

---

Use it or don't.
