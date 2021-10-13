FROM alpine:latest

MAINTAINER vencis vaclav@fiserovi.net

RUN apk --update add bash coreutils tzdata openssl heirloom-mailx ca-certificates && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

ADD https://raw.githubusercontent.com/Matty9191/ssl-cert-check/master/ssl-cert-check /ssl-cert-check
COPY files/run.sh /run.sh
COPY files/mailrc.template /tmp/

RUN chmod +x /ssl-cert-check
RUN chmod +x /run.sh

CMD /run.sh
