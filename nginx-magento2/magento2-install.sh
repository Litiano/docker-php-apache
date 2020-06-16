ENV MAGENTO_VERSION 2.3.5-p1

RUN cd /var/www && \
    rm -rf html && \
    wget https://github.com/magento/magento2/archive/$MAGENTO_VERSION.zip && \
    unzip $MAGENTO_VERSION.zip && \
    mv magento2-$MAGENTO_VERSION html && \
    rm -rf $MAGENTO_VERSION.zip && \
    cd html && \
    find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} + && \
    find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} + && \
    chown -R :www-data . && \
    chmod u+x bin/magento

RUN cd /var/www/html \
    && composer require rafaelstz/traducao_magento2_pt_br:dev-master \
    imaginationmedia/correios