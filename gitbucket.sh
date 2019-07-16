#!/bin/bash -eux

if [ -n "${DATABASE_URL}" ] && [ -n "${DATABASE_USER}" ] && [ -n "${DATABASE_PASSWORD}" ];then
	cat > /gitbucket/database.conf <<- EOF
		db {
		  url = "${DATABASE_URL}"
		  user = "${DATABASE_USER}"
		  password = "${DATABASE_PASSWORD}"
		}
	EOF
fi

exec java -jar /opt/gitbucket.war --gitbucket.home=/gitbucket
