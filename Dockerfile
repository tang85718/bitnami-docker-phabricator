FROM gcr.io/stacksmith-images/ubuntu:14.04-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=phabricator \
    BITNAMI_IMAGE_VERSION=2016.35-r0 \
    PATH=/opt/bitnami/arcanist/bin:/opt/bitnami/php/bin:/opt/bitnami/mysql/bin:$PATH

# Additional modules required
RUN bitnami-pkg unpack apache-2.4.23-2 --checksum be3c28581f363e240f04c2d32bcf2d4a5ea0926722bb23ab9f5dfb38bde22bac
RUN bitnami-pkg unpack php-5.6.25-0 --checksum f0e8d07d155abdb5d6843931d3ffbf9b4208fff248c409444fdd5a8e3a3da01d
RUN bitnami-pkg install libphp-5.6.21-2 --checksum 83d19b750b627fa70ed9613504089732897a48e1a7d304d8d73dec61a727b222
RUN bitnami-pkg install mysql-client-10.1.13-4 --checksum 14b45c91dd78b37f0f2366712cbe9bfdf2cb674769435611955191a65dbf4976
RUN bitnami-pkg install git-2.6.1-1 --checksum e50e7a845e583c4f275ebd9899f378dc6a7e96e830324ae378540aa7940acbb7

# Install phabricator
RUN bitnami-pkg unpack phabricator-2016.35-0 --checksum 30be7722b57d2a2602be1de2e53cd8c7b88dfd25198292683beeb351a70b3d9a

COPY rootfs /

VOLUME ["/bitnami/phabricator", "/bitnami/apache", "/bitnami/php"]

EXPOSE 80 443

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["/init.sh"]
