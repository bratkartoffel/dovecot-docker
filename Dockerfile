FROM alpine:3.19

# install packages
RUN apk upgrade --no-cache \
        && apk add --no-cache \
        dovecot dovecot-pigeonhole-plugin dovecot-lmtpd dovecot-pgsql dovecot-fts-solr \
        s6 setpriv tzdata

# add the custom configurations
COPY rootfs/ /

# mails should be persistent
VOLUME /var/mail

# 143: imag
# 993: imaps
# 4190: managesieve
EXPOSE 143/tcp 993/tcp 4190/tcp

CMD [ "/entrypoint.sh" ]

