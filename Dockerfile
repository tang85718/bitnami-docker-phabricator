FROM gcr.io/stacksmith-images/ubuntu:14.04-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=phabricator \
    BITNAMI_IMAGE_VERSION=2016.31-r0 \
    PATH=/opt/bitnami/arcanist/bin:/opt/bitnami/php/bin:/opt/bitnami/mysql/bin:$PATH

# Additional modules required
RUN bitnami-pkg install php-5.6.24-1 --checksum 6cdb5736757bfe0a950034d0dc85a48c3e4ab02bec64c90f0c44454069362e65
RUN bitnami-pkg unpack apache-2.4.23-1 --checksum c8d14a79313c5e47dbf617e9a55e88ff91d8361357386bab520aabccd35c59d8
RUN bitnami-pkg install libphp-5.6.21-2 --checksum 83d19b750b627fa70ed9613504089732897a48e1a7d304d8d73dec61a727b222
RUN bitnami-pkg install git-2.6.1-1 --checksum e50e7a845e583c4f275ebd9899f378dc6a7e96e830324ae378540aa7940acbb7
RUN bitnami-pkg install mysql-client-10.1.13-4 --checksum 14b45c91dd78b37f0f2366712cbe9bfdf2cb674769435611955191a65dbf4976

# Install phabricator
RUN bitnami-pkg unpack phabricator-2016.31-0 --checksum f8bd544cca6e4cb56d0194dc25737d5ce14dba2e4eaf355c9fe5702472ca4e13

COPY rootfs /

VOLUME ["/bitnami/phabricator", "/bitnami/apache"]

EXPOSE 80 443

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["/init.sh"]
