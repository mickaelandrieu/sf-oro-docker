FROM alpine:latest
MAINTAINER Stepan Yudin <stepan.sib@gmail.com>

ENV REFRESHED_AT 2016–09-22

RUN mkdir -p /var/app/cache
RUN mkdir -p /var/app/logs
RUN mkdir -p /var/app/vendor

RUN chmod -R 777 /var/app/cache
RUN chmod -R 777 /var/app/logs
RUN chmod -R 777 /var/app/vendor

VOLUME /var/app/cache
VOLUME /var/app/logs
VOLUME /var/app/vendor

CMD ["/usr/bin/tail","-f","/dev/null"]
