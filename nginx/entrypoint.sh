#!/bin/sh

set -e

# Var checks
if [ -n "$FLUTTER_HOST" ] && \
    [ -n "$FLUTTER_PORT" ] && \
    [ -n "$FLUTTER_DOMAIN" ] && \
    [ -n "$LE_EMAIL" ]; then
    # Inject variables
    sed -i s/__FLUTTER_HOST__/$FLUTTER_HOST/g /etc/nginx/conf.d/flutter.conf
    sed -i s/__FLUTTER_PORT__/$FLUTTER_PORT/g /etc/nginx/conf.d/flutter.conf

    sed -i s/__FLUTTER_DOMAIN__/$FLUTTER_DOMAIN/g /etc/nginx/conf.d/flutter.conf
    sed -i s/__FLUTTER_DOMAIN__/$FLUTTER_DOMAIN/g /etc/nginx/conf.d/lets-encrypt.conf
    
    LE_OPTIONS=$(eval echo $LE_OPTIONS)
    LE_RENEW_OPTIONS=$(eval echo $LE_RENEW_OPTIONS)
    LE_RENEW_CRON_COMMAND=$(eval echo $LE_RENEW_CRON_COMMAND)

    # Disable FLUTTER config first as cert not present.
    echo "Disabling FLUTTER config..."
    mv -v /etc/nginx/conf.d/flutter.conf /etc/nginx/conf.d/flutter.conf.disabled

    (
        # Give nginx time to start
        sleep 5

        echo "Starting Let's Encrypt certificate install..."
        certbot certonly --non-interactive "${LE_OPTIONS}" \
            --agree-tos --email "${LE_EMAIL}" \
            --webroot -w /usr/share/nginx/html -d $FLUTTER_DOMAIN

        # Enable FLUTTER config
        echo "Re-Enabling FLUTTER config with SSL certificate..."
        mv -v /etc/nginx/conf.d/flutter.conf.disabled /etc/nginx/conf.d/flutter.conf

        echo "Reloading NGINX with SSL..."
        nginx -s reload

        # Install crontab for cert renewal
        echo "Installing crontab for automated certificate renewal..."
        touch crontab.tmp \
            && echo "37 2 * * * certbot renew ${LE_RENEW_OPTIONS} --post-hook 'nginx -s reload' && ${LE_RENEW_CRON_COMMAND} > /dev/null 2>&1" > crontab.tmp \
            && crontab crontab.tmp \
            && rm crontab.tmp

        # Start crond
        /usr/sbin/crond
    ) &

    # Start nginx
    echo "Starting NGINX..."
    nginx -g "daemon off;"
else
    echo "ERROR: please provide FLUTTER_HOST, FLUTTER_PORT, FLUTTER_DOMAIN, LE_EMAIL"
fi