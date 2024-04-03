#!/bin/bash
set -e

uid=$(stat -c %u /home/app)
gid=$(stat -c %g /home/app)

if [ $# -eq 0 ]; then
    php-fpm
else
    exec "$@"
fi