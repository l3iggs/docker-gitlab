FROM l3iggs/lamp-aur
MAINTAINER l3iggs <l3iggs@live.com>

# install gitlab
RUN yaourt -S --noconfirm --needed gitlab

# copy over apache configuration file(s)
RUN sudo cp /etc/webapps/gitlab/apache.conf.example /etc/httpd/conf/extra/gitlab.conf

# remove info.php
RUN sudo rm /srv/http/info.php

# expose the relevant ports
EXPOSE 80
EXPOSE 443
EXPOSE 22

# start apache web server and mariadb database server
CMD ["cd '/usr'; sudo /usr/bin/mysqld_safe --datadir='/var/lib/mysql'& sudo apachectl -DFOREGROUND"]
