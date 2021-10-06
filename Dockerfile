FROM debian:jessie

MAINTAINER dario dario@dariozanzico.com

RUN \
  apt-get update && \
  apt-get install -y openssl heirloom-mailx ca-certificates && \
  rm -fr /var/lib/apt/lists/*
ADD https://raw.githubusercontent.com/Matty9191/ssl-cert-check/master/ssl-cert-check /ssl-cert-check
COPY files/run.sh /run.sh
COPY files/mailrc.template /tmp/

RUN sed -i '/^mozilla\/DST_Root_CA_X3/s/^/!/' /etc/ca-certificates.conf && update-ca-certificates -f
RUN chmod +x /ssl-cert-check
RUN chmod +x /run.sh

CMD /run.sh
