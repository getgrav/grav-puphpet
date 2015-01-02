#!/bin/sh

# Get index.php
wget 'https://gist.githubusercontent.com/rhukster/0457961221a14d0ee2c0/raw/6f925c18f7831de3cc0bbce6c129114dcd94e030/Vagrant%20Landing%20Page' -q -O /var/www/grav/index.html
echo 'Created /var/www/grav/index.html'; chown 501:dialout /var/www/grav/index.html

# PHPInfo()
echo '<?php phpinfo();' > /var/www/grav/info.php 
echo 'Created /var/www/grav/info.php'; chown 501:dialout /var/www/grav/info.php

# get Core
wget -q `wget -qO- 'https://api.github.com/repos/getgrav/grav/releases' | sed -n '/browser_download_url/{p;q;}'| sed -e 's#.* \(\)#\1#' | sed -e 's/^"//' -e 's/"$//' | sed 's/-update//'` -O /var/www/grav/tmp.zip; cd /var/www/grav; unzip -q tmp.zip; mv grav core; rm tmp.zip; chown -R 501:dialout core
echo 'Created /var/www/grav/core'

# get Blog Skeleton
wget -q `wget -qO- 'https://api.github.com/repos/getgrav/grav-skeleton-blog-site/releases' | sed -n '/browser_download_url/{p;q;}'| sed -e 's#.* \(\)#\1#' | sed -e 's/^"//' -e 's/"$//'` -O /var/www/grav/tmp.zip; cd /var/www/grav; unzip -q tmp.zip; mv grav-skeleton-blog-site blog; rm tmp.zip; chown -R 501:dialout blog
echo 'Created /var/www/grav/blog'

# get OnePage Skeleton
wget -q `wget -qO- 'https://api.github.com/repos/getgrav/grav-skeleton-onepage-site/releases' | sed -n '/browser_download_url/{p;q;}'| sed -e 's#.* \(\)#\1#' | sed -e 's/^"//' -e 's/"$//'` -O /var/www/grav/tmp.zip; cd /var/www/grav; unzip -q tmp.zip; mv grav-skeleton-onepage-site onepage; rm tmp.zip; chown -R 501:dialout onepage
echo 'Created /var/www/grav/onepage'

# get Shop Skeleton
wget -q `wget -qO- 'https://api.github.com/repos/getgrav/grav-skeleton-shop-site/releases' | sed -n '/browser_download_url/{p;q;}'| sed -e 's#.* \(\)#\1#' | sed -e 's/^"//' -e 's/"$//'` -O /var/www/grav/tmp.zip; cd /var/www/grav; unzip -q tmp.zip; mv grav-skeleton-shop-site shop; rm tmp.zip; chown -R 501:dialout shop
echo 'Created /var/www/grav/shop'


