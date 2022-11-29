#!/usr/bin/env bash

if ! [ -f /var/www/html/system/data/autoconfig.php ]; then
    echo "Restoring default config"
    cp -R /filerun/data/* /var/www/html/system/data
fi

chown -R "$APACHE_RUN_USER":"$APACHE_RUN_GROUP" /var/www/html

exec "$@"
