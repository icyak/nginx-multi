#!/bin/sh

#APP="http://127.0.0.1:80"

/bin/sed -i "s|__APP__|${APP}|" /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
nginx -c /etc/nginx/conf.d/default.conf



