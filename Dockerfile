FROM quay.io/fluentd_elasticsearch/fluentd:v2.7.0

RUN apt-get update \
 && buildDeps="build-essential zlib1g-dev ruby-dev" \
 && apt-get install -y --no-install-recommends $buildDeps \
 && gem install fluent-plugin-azure-storage-append-blob --version 0.1.1 \
 && gem install fluent-plugin-s3 --version 1.3.0 \
 && apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

EXPOSE 24224 5140
