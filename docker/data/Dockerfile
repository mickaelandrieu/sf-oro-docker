FROM alpine:latest
MAINTAINER Stepan Yudin <stepan.sib@gmail.com>

ENV REFRESHED_AT 2016–09-22

RUN mkdir -p /var/app/cache
RUN mkdir -p /var/app/logs
RUN mkdir -p /var/www/app/vendor
RUN mkdir -p /var/www/app/bin
RUN mkdir -p /var/www/app/app/cache
RUN mkdir -p /var/www/app/app/logs

RUN chmod -R 777 /var/app/cache
RUN chmod -R 777 /var/app/logs
RUN chmod -R 777 /var/www/app/vendor
RUN chmod -R 777 /var/www/app/bin
RUN chmod -R 777 /var/www/app/app/cache
RUN chmod -R 777 /var/www/app/app/logs

VOLUME /var/app/cache
VOLUME /var/app/logs
VOLUME /var/www/app/vendor
VOLUME /var/www/app/bin
VOLUME /var/www/app/app/cache
VOLUME /var/www/app/app/logs

CMD ["/usr/bin/tail","-f","/dev/null"]
