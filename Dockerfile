# TODO cross platform, easier if they publish a multiplatform manifest
FROM filerun/filerun:arm64v8

# Run once to cause filerun to be downloaded
RUN /filerun/entrypoint.sh echo

COPY --chown=${APACHE_RUN_USER}:${APACHE_RUN_GROUP} ./autologin.php /var/www/html/autologin.php
COPY --chown=${APACHE_RUN_USER}:${APACHE_RUN_GROUP} ./autologin.htaccess /var/www/html/.htaccess
