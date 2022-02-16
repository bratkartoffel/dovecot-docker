FROM alpine:3.15

# install packages
RUN apk upgrade --no-cache \
        && apk add --no-cache \
        dovecot dovecot-pigeonhole-plugin dovecot-lmtpd dovecot-pgsql dovecot-fts-solr \
        s6 setpriv

# add the custom configurations
COPY rootfs/ /

CMD [ "/entrypoint.sh" ]

