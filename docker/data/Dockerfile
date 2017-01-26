FROM alpine:latest
MAINTAINER Stepan Yudin <stepan.sib@gmail.com>

ENV REFRESHED_AT 2016–11-30

# Create Symfony dirs to set em writable
RUN mkdir -p /var/www/app/vendor
RUN mkdir -p /var/www/app/bin
RUN mkdir -p /var/www/app/app/cache
RUN mkdir -p /var/www/app/app/logs

# Set Symfony dirs writable
RUN chmod -R 777 /var/www/app/vendor
RUN chmod -R 777 /var/www/app/bin
RUN chmod -R 777 /var/www/app/app/cache
RUN chmod -R 777 /var/www/app/app/logs

# Expose Symfony dirs
VOLUME /var/www/app/vendor
VOLUME /var/www/app/bin
VOLUME /var/www/app/app/cache
VOLUME /var/www/app/app/logs

CMD ["/usr/bin/tail","-f","/dev/null"]
