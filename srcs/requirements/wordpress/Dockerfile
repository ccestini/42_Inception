
FROM debian:bullseye

ARG WP_ADMIN_USER
ARG WP_ADMIN_PWD
ARG WP_ADMIN_EMAIL
ARG WP_USER
ARG WP_PWD
ARG WP_EMAIL

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget curl php-fpm php-mysql php-zip
RUN service php7.4-fpm start

EXPOSE 9000

COPY ./conf/wp-config.php /
COPY ./tools/wp-script.sh /

RUN chmod +x /wp-script.sh

CMD ["./wp-script.sh"]

# *My notes*
# debian bullseye has version of php7.4
# using php config file and also a script to create the website page sample
# RUN service php7.4-fpm start: Starts the PHP-FPM (PHP FastCGI Process Manager) service, this ensures php-fpm is ready, when is only in the script was not working
# within the Docker image. PHP-FPM is used to handle PHP processing for web applications like WordPress.
# Wordpress: is an open-source content management system (CMS), created in 2003. It’s a popular tool for individuals without any coding experience who want to build websites and blogs.
# Php: A popular general-purpose scripting language that is especially suited to web development.
# Php-Fpm: A set of libraries for FastCGI API, it will make friends between our nginx and php. Installed in a container with php.
# FastCGI is an interface between Web servers and applications which combines some of the performance characteristics of native Web server modules with the Web server independence of the Common Gateway Interface (CGI) programming interface.
# CMD runs the script and the php service, thats inside the script.

