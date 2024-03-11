# Utilisez une image PHP 8.1 avec Apache pour Laravel
FROM php:8.1-apache

# Installez les extensions PHP nécessaires et d'autres dépendances
RUN apt-get update && \
    apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip unzip git libpq-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql pdo_pgsql

# Activez le module Apache mod_rewrite
RUN a2enmod rewrite

# Définissez le répertoire de travail
WORKDIR /var/www/html

# Copiez les fichiers de votre projet Laravel dans le conteneur
COPY . .

# Définissez le répertoire racine pour Apache
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

# Installez Composer (gestionnaire de dépendances PHP)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installez les dépendances PHP de votre projet Laravel
RUN composer install

#Définition des variables d'environnements
ENV APP_NAME=${APP_NAME}
ENV APP_ENV=${APP_ENV}
ENV APP_KEY=${APP_KEY}
ENV APP_DEBUG=${APP_DEBUG}
ENV APP_URL=${APP_URL}

ENV LOG_CHANNEL=${LOG_CHANNEL}
ENV LOG_DEPRECATIONS_CHANNEL=${LOG_DEPRECATIONS_CHANNEL}
ENV LOG_LEVEL=${LOG_LEVEL}

ENV DB_CONNECTION=${DB_CONNECTION}
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_DATABASE=${DB_DATABASE}
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}

ENV BROADCAST_DRIVER=${BROADCAST_DRIVER}
ENV CACHE_DRIVER=file
ENV CACHE_PATH=/var/www/html/storage/cache
ENV FILESYSTEM_DISK=${FILESYSTEM_DISK}
ENV QUEUE_CONNECTION=${QUEUE_CONNECTION}
ENV SESSION_DRIVER=${SESSION_DRIVER}
ENV SESSION_LIFETIME=${SESSION_LIFETIME}

ENV MEMCACHED_HOST=${MEMCACHED_HOST}

ENV REDIS_HOST=${REDIS_HOST}
ENV REDIS_PASSWORD=${REDIS_PASSWORD}
ENV REDIS_PORT=${REDIS_PORT}

ENV MAIL_MAILER=${MAIL_MAILER}
ENV MAIL_HOST=${MAIL_HOST}
ENV MAIL_PORT=${MAIL_PORT}
ENV MAIL_USERNAME=${MAIL_USERNAME}
ENV MAIL_PASSWORD=${MAIL_PASSWORD}
ENV MAIL_ENCRYPTION=${MAIL_ENCRYPTION}
ENV MAIL_FROM_ADDRESS=${MAIL_FROM_ADDRESS}
ENV MAIL_FROM_NAME=${APP_NAME}

ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
ENV AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}
ENV AWS_BUCKET=${AWS_BUCKET}
ENV AWS_USE_PATH_STYLE_ENDPOINT=${AWS_USE_PATH_STYLE_ENDPOINT}

ENV PUSHER_APP_ID=${PUSHER_APP_ID}
ENV PUSHER_APP_KEY=${PUSHER_APP_KEY}
ENV PUSHER_APP_SECRET=${PUSHER_APP_SECRET}
ENV PUSHER_HOST=${PUSHER_HOST}
ENV PUSHER_PORT=${PUSHER_PORT}
ENV PUSHER_SCHEME=${PUSHER_SCHEME}
ENV PUSHER_APP_CLUSTER=${PUSHER_APP_CLUSTER}

ENV VITE_APP_NAME=${APP_NAME}
ENV VITE_PUSHER_APP_KEY=${PUSHER_APP_KEY}
ENV VITE_PUSHER_HOST=${PUSHER_HOST}
ENV VITE_PUSHER_PORT=${PUSHER_PORT}
ENV VITE_PUSHER_SCHEME=${PUSHER_SCHEME}
ENV VITE_PUSHER_APP_CLUSTER=${PUSHER_APP_CLUSTER}
