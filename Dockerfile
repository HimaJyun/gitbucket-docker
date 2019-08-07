FROM openjdk:jre-slim
LABEL maintainer="HimaJyun"

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.version="4.32.0"
LABEL org.label-schema.vcs-url="https://github.com/HimaJyun/gitbucket-docker"

ENV DATABASE_URL=""
ENV DATABASE_USER=""
ENV DATABASE_PASSWORD=""

COPY gitbucket.sh /opt/gitbucket.sh

RUN set -x \
    && groupadd -r gitbucket \
    && useradd -r -s /bin/false -d /gitbucket -M -g gitbucket gitbucket \
    && apt-get update \
    && apt-get install -y gosu wget \
    && wget -O "/opt/gitbucket.war" "https://github.com/gitbucket/gitbucket/releases/download/4.32.0/gitbucket.war" \
    && chmod 444 "/opt/gitbucket.war" \
    && apt-get purge -y --auto-remove wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

VOLUME /gitbucket

EXPOSE 8080
EXPOSE 29418

CMD ["/opt/gitbucket.sh"]
