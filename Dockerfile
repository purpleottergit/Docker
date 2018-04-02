FROM ubuntu:latest
# Install apache and PHP
RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 php7.0 php7.0-mysql libapache2-mod-php7.0
# Enable mods in apache2 configuration for PHP and rewrite
RUN a2enmod php7.0
RUN a2enmod rewrite
# Make changes to the PHP.ini file
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.0/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.0/apache2/php.ini
# Set up the apache ENV variables
# The apache2 run user(s) and group(s)
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
# other bits
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
# Expose apache2 port 80 (don't forget to map this when running)
EXPOSE 80
# Copy the local www (with our PHP file) into the server
ADD www /var/www/site
# Add in our revised apache2 config file
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
# Start apache2
CMD /usr/sbin/apache2ctl -D FOREGROUND
