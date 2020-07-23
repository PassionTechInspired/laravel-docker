FROM php:7.4-fpm
LABEL maintainer "Spy Kab <ooo000spy000ooo@gmail.com>"

# Arguments defined in docker-compose.yml
# ARG user
# ARG uid

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libzip-dev 

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install -j$(nproc) gd pdo_mysql mbstring exif pcntl bcmath zip

# Option 1:
# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Option 2:
# Install PHP Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u $uid -d /home/$user $user
# RUN mkdir -p /home/$user/.composer && \
#    chown -R $user:$user /home/$user

# Set working directory
WORKDIR /var/www/html


# Copy existing application directory (Using this command in the project)
# COPY . .

# USER 1001
