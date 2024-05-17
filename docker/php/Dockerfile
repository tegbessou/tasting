FROM dunglas/frankenphp

RUN install-php-extensions \
 pdo_mysql \
 gd \
 intl \
 zip \
 opcache

RUN docker-php-source extract \
    && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/6.0.2.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mv phpredis-6.0.2 /usr/src/php/ext/redis

RUN install-php-extensions \
 redis

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /home/app

# Dynamically set www-data UID/GID based on /home/app ownership
RUN uid=$(stat -c %u /home/app) && \
    gid=$(stat -c %g /home/app) && \
    if [ $uid != 0 ] || [ $gid != 0 ]; then \
        sed -i "s/`id -u www-data`:`id -g www-data`/$uid:$gid/g" /etc/passwd && \
        mkdir -p /var/log/php && \
        chown -R $uid:$gid /var/log/php; \
    fi

# Upgrade bash configuration
COPY .bashrc /home/www-data/.bashrc

# Expose port 8080
EXPOSE 8080