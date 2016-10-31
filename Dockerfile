FROM gcr.io/stacksmith-images/ubuntu:14.04-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=phabricator \
    BITNAMI_IMAGE_VERSION=2016.44-r0 \
    PATH=/opt/bitnami/arcanist/bin:/opt/bitnami/php/bin:/opt/bitnami/mysql/bin:$PATH

# Additional modules required
RUN bitnami-pkg unpack apache-2.4.23-8 --checksum 391deed983f7aaa04b4b47af59d8e8ced4f88076eff18d5405d196b6b270433c
RUN bitnami-pkg unpack php-5.6.27-0 --checksum d5b84af990080fb396232558ab70276af4ba85b23ccf8641b6fb11982aa7b83e
RUN bitnami-pkg install libphp-5.6.27-0 --checksum f9039cc69834334187c9b55fc20bf3be818cd87a2088ced2732fead1d1bfb2d6
RUN bitnami-pkg install git-2.6.1-2 --checksum edc04dc263211f3ffdc953cb96e5e3e76293dbf7a97a075b0a6f04e048b773dd
RUN bitnami-pkg install mysql-client-10.1.18-0 --checksum f2f20e0512e7463996a6ad173156d249aa5ca746a1edb6c46449bd4d2736f725

# Install phabricator
RUN bitnami-pkg unpack phabricator-2016.44-0 --checksum 30c86b814b3f63841eaa3de9d657dc947eb63661453a57efbd03fb7fd9c8a686

COPY rootfs /

VOLUME ["/bitnami/phabricator", "/bitnami/apache", "/bitnami/php"]

EXPOSE 80 443

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["/init.sh"]
