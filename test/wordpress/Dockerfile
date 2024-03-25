# Set the base image
FROM alpine:3.19.1

# Install necessary packages
RUN apk add --update --no-cache \
    php83 \
    php83-fpm \
    php83-opcache \
    php83-gd \
    php83-mysqli \
    php83-zlib \
    php83-curl \
    php83-mbstring \
    php83-json \
    php83-session \
    php83-xml \
    php83-iconv \
    php83-dom \          # For DOM manipulation, used by many plugins
    php83-xmlreader \    # For reading XML files
    php83-ctype \        # For character type checking, required by some functions of WordPress
    php83-tokenizer \    # Required for some plugins/themes that use tokenization
    php83-simplexml \    # Used for parsing XML
    php83-xmlwriter \    # For writing XML, might be needed by plugins
    php83-fileinfo \     # Required for dealing with file uploads and media
    php83-pecl-redis \   # Optional, if you plan to use Redis for caching
    php83-pecl-memcached # Optional, if you plan to use Memcached for caching

# Download and install WordPress
RUN curl -o wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz \
    && tar -xzf wordpress.tar.gz -C /var/www/ \
    && rm wordpress.tar.gz

# Configure Nginx and PHP
COPY nginx.conf /etc/nginx/nginx.conf
COPY php-fpm.conf /etc/php7/php-fpm.d/www.conf
COPY supervisord.conf /etc/supervisord.conf

# Add the WordPress configuration
COPY wp-config.php /var/www/wordpress/wp-config.php

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
