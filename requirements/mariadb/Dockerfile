FROM	alpine:3.19
RUN		apk update
RUN		apk add --no-cache --quiet --update mariadb mariadb-client vim
RUN 	mkdir -p /var/lib/mysqld /run/mysqld
COPY	./config/init_db.sql /tmp/init_db.sql
COPY	./tools/set_db.sh ./

COPY 	./config/mariadb-server.cnf /etc/my.cnf.d/

RUN 	chmod +x ./set_db.sh
RUN		mariadb-install-db --datadir=/var/lib/mysql \
			--auth-root-authentication-method=normal
RUN		chown -R mysql:mysql /var/lib/mysql 
RUN 	chown -R mysql:mysql /run/mysqld

ENTRYPOINT [ "sh", "set_db.sh" ]