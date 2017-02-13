FROM alpine:latest
MAINTAINER Stepan Yudin <stepan.sib@gmail.com>

ENV REFRESHED_AT 2017–02-13

# Create Symfony dirs to set em writable
RUN mkdir -p /var/www/backend/vendor
RUN mkdir -p /var/www/backend/bin
RUN mkdir -p /var/www/backend/app/cache
RUN mkdir -p /var/www/backend/app/logs

# Set Symfony dirs writable
RUN chmod -R 777 /var/www/backend/vendor
RUN chmod -R 777 /var/www/backend/bin
RUN chmod -R 777 /var/www/backend/app/cache
RUN chmod -R 777 /var/www/backend/app/logs

# Expose Symfony dirs
VOLUME /var/www/backend/vendor
VOLUME /var/www/backend/bin
VOLUME /var/www/backend/app/cache
VOLUME /var/www/backend/app/logs

# Create node dirs to set em writable
#RUN mkdir -p /var/www/frontend/node_modules

# Set node dirs writable
#RUN chmod -R 777 /var/www/frontend/node_modules

# Expose node dirs
#VOLUME /var/www/frontend/node_modules

CMD ["/usr/bin/tail","-f","/dev/null"]
