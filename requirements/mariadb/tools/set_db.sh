cat .setup 2> /dev/null
if [ $? -ne 0 ]; then
    # Start MySQL/MariaDB service
    /usr/bin/mysqld_safe --datadir=/var/lib/mysql &

    # Wait for MySQL/MariaDB service to become available
    while ! mysqladmin ping -h "$MYSQL_HOSTNAME" --silent; do
        sleep 1
    done

    # Initialize database using init_db.sql
    eval "echo \"$(cat /tmp/init_db.sql)\"" | mariadb

    # Create .setup file to indicate setup completion

    touch .setup
fi

    # If .setup file exists, only start MySQL/MariaDB service
/usr/bin/mysqld_safe --datadir=/var/lib/mysql

while true; do
    sleep 1
done
# Once inside the container, you can execute MySQL commands like:
# mysql -u root -p (then enter root password)
# SHOW DATABASES;
# use 'wordpress';
# SHOW TABLES;
# SELECT wp_users.display_name FROM wp_users;
# SELECT * FROM wp_users;