FROM php:7.4-fpm
LABEL maintainer "Spy Kab <ooo000spy000ooo@gmail.com>"

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Option 1:
# Get latest Composer
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Option 2:
# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Set working directory
# Original image already has this WORKDIR
WORKDIR /var/www/html

# Copy existing application directory (Using this command in the project)
# COPY . .

USER 1001
