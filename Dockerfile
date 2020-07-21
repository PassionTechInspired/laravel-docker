FROM php:7.4-fpm-alpine
LABEL maintainer "Spy Kab <ooo000spy000ooo@gmail.com>"

# Install system dependencies
RUN apk update && apk add --no-cache \
    git \
    curl \
    libpng-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Option 1:
# Get latest Composer
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Option 2:
# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
# Original image already has this WORKDIR
WORKDIR /var/www/html

# Copy existing application directory (Using this command in the project)
# COPY . .

# USER 1001
