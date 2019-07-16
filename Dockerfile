FROM openjdk:jre-slim
LABEL maintainer="HimaJyun"

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.version="4.31.2"
LABEL org.label-schema.vcs-url="https://github.com/HimaJyun/gitbucket-docker"

ENV DATABASE_URL=""
ENV DATABASE_USER=""
ENV DATABASE_PASSWORD=""

COPY gitbucket.sh /opt/gitbucket.sh
ADD https://github.com/gitbucket/gitbucket/releases/download/4.31.2/gitbucket.war /opt/gitbucket.war

VOLUME /gitbucket

EXPOSE 8080
EXPOSE 29418

CMD ["/opt/gitbucket.sh"]
