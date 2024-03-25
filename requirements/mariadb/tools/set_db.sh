cat .setup 2> /dev/null
if [ $? -ne 0 ]; then
	usr/bin/mysqld_safe --datadir=/var/lib/mysql &


	while ! mysqladmin ping -h "$MYSQL_HOSTNAME" --silent; do
    	sleep 1
	done

	eval "echo \"$(cat /tmp/init_db.sql)\"" | mariadb
	touch .setup
fi

# usr/bin/mysqld_safe --datadir=/var/lib/mysql
