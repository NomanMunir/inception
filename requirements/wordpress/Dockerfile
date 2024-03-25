FROM alpine:3.19

RUN apk update && \
    apk add php83 php83-cli php83-fpm php83-mysqli \
    php83-json php83-openssl php83-curl php83-zlib \
    php83-xml php83-phar php83-intl php83-dom curl \
    wget tar openrc vim php83-cgi



# I need to install wp_cli command and put it in the right directory /usr/local/bin
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp


# Copy the .conf in the html directory

COPY ./www.conf /etc/php83/php-fpm.d

#Create the folder to enable php start
# RUN mkdir /run/php

#we copy the script, give the right to launch it in local on our computer
COPY ./create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

#We go the html directory
WORKDIR /var/www/html/

#We expose the 9000 port
EXPOSE 9000

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
CMD ["/usr/sbin/php-fpm83", "-F"]
