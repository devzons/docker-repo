FROM drupal:9

RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html/themes

RUN git clone -b 9.0.x https://git.drupalcode.org/project/drupal.git \
    && chown -R www-data:www-data bootstrap

WORKDIR /var/www/html