FROM php:5.6-fpm
MAINTAINER Stepan Yudin <stepan.sib@gmail.com>

ENV REFRESHED_AT 2017–02-13

# Create nginx user and set permissions
RUN useradd -ms /bin/bash nginx
RUN usermod -aG sudo nginx
RUN chown -R nginx /usr/local

# Install libs
RUN apt-get update && apt-get install -y \
  zlib1g-dev \
  libicu-dev g++ \
  libmcrypt-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng12-dev \
  libldap2-dev \
  libxml2-dev \
  libcurl4-openssl-dev \
  libtidy-dev \
  zip \
  unzip \
  wget \
  xvfb \
  wkhtmltopdf \
  git

# Install fresh node & npm
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs \
  build-essential

# Configure PHP extensions
RUN docker-php-ext-configure intl
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/

# Install PHP extensions
RUN docker-php-ext-install \
  curl \
  intl \
  mcrypt \
  gd \
  ldap \
  opcache \
  pdo \
  pdo_mysql \
  soap \
  zip \
  tidy \
  bcmath

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Webpack
RUN npm install -g webpack

# Install Bower
RUN npm install -g bower

# Install Vue Cli
RUN npm install -g vue-cli

# Install Symfony installer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# Configure PHP and FPM
ADD ./php.ini /usr/local/etc/php/
COPY php-fpm.conf /etc/php-fpm.conf

WORKDIR "/var/www/backend"
USER nginx
