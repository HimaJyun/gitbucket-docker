#!/bin/bash -eu

if [ -n "${DATABASE_URL}" ] && [ -n "${DATABASE_USER}" ] && [ -n "${DATABASE_PASSWORD}" ];then
	cat > /gitbucket/database.conf <<- EOF
		db {
		  url = "${DATABASE_URL}"
		  user = "${DATABASE_USER}"
		  password = "${DATABASE_PASSWORD}"
		}
	EOF
fi

if [ "$(id -u)" = "0" ];then
	chown -R gitbucket "/gitbucket"
	chmod 700 "/gitbucket"

	exec gosu gitbucket java -jar /opt/gitbucket.war --gitbucket.home=/gitbucket
fi

java -jar /opt/gitbucket.war --gitbucket.home=/gitbucket
