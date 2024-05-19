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

ARG USER=www-data

RUN \
 # Ajouter la capacité supplémentaire de se lier aux ports 80 et 443
 setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/frankenphp; \
 # Donner l'accès en écriture à /data/caddy et /config/caddy
 chown -R ${USER}:${USER} /data/caddy && chown -R ${USER}:${USER} /config/caddy; \
 mkdir /home/app/vendor; \
 chown -R ${USER}:${USER} /home/app/vendor;

USER ${USER}

# Upgrade bash configuration
COPY .bashrc /home/www-data/.bashrc

# Expose port 8080
EXPOSE 8080