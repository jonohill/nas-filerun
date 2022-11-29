# TODO cross platform, easier if they publish a multiplatform manifest
FROM filerun/filerun:arm64v8

ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_USER_ID=33
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_RUN_GROUP_ID=33

# Run once to cause filerun to be downloaded
RUN /filerun/entrypoint.sh echo && \
    cp -R /var/www/html/system/data /filerun/data

COPY --chown=${APACHE_RUN_USER}:${APACHE_RUN_GROUP} ./autologin.php /var/www/html/autologin.php
COPY --chown=${APACHE_RUN_USER}:${APACHE_RUN_GROUP} ./autologin.htaccess /var/www/html/.htaccess

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/filerun/supervisord.conf"]
