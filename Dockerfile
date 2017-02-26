FROM php:7.1-apache
#
# simple httpd container running elfinder
# to give a simple access point to nzbhydra downloads
#

ARG ELFINDER_VERSION

RUN apt-get update && apt-get install -y \
  unzip  && \
  rm -rf /var/lib/apt/lists/* && \
  curl -Lo /tmp/elfinder-${ELFINDER_VERSION}.zip https://github.com/Studio-42/elFinder/archive/${ELFINDER_VERSION}.zip && \
  unzip /tmp/elfinder-${ELFINDER_VERSION}.zip -d /tmp && \
  mv /tmp/elFinder-${ELFINDER_VERSION}/* /var/www/html/ && \
  ln -s /var/www/html/elfinder.html /var/www/html/index.html && \
  chown -R www-data:www-data /var/www/html/* && \
  rm -rf /tmp/elFinder-${ELFINDER_VERSION} /tmp/elfinder-${ELFINDER_VERSION}.zip && \
  rm -rf /var/lib/apt/lists/*

ADD build/var/www/html/php/connector.minimal.php /var/www/html/php/connector.minimal.php