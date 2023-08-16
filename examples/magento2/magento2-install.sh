cd /var/www

## install with git download.
#MAGENTO_VERSION="2.3.5-p1"
#wget https://github.com/magento/magento2/archive/$MAGENTO_VERSION.zip
#unzip $MAGENTO_VERSION.zip
#cp magento2-$MAGENTO_VERSION/. html
#rm -rf $MAGENTO_VERSION.zip magento2-$MAGENTO_VERSION

#create-project with composer. Require credentials
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento2
cp -r magento2/. html/
rm -rf magento2

#set permissions
cd html/
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
chown -R :www-data . # Ubuntu
chmod u+x bin/magento

#install modules
composer require rafaelstz/traducao_magento2_pt_br:dev-master imaginationmedia/correios
composer require --dev smile/module-debug-toolbar

#install Magento2
bin/magento setup:install \
--base-url=http://127.0.0.1:8090 \
--db-host=mysql \
--db-name=magento2 \
--db-user=root \
--db-password=root \
--admin-firstname=admin \
--admin-lastname=admin \
--admin-email=admin@admin.com \
--admin-user=admin \
--admin-password=admin123 \
--language=pt_BR \
--currency=BRL \
--timezone=America/Bahia \
--use-rewrites=1
