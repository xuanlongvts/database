# On Ubuntu

### Remove mysql

    1. sudo apt-get remove --purge mysql*
    2. sudo apt-get purge mysql*
    3. sudo apt-get autoremove
    4. sudo apt-get autoclean
    5. sudo apt-get dist-upgrade
    6. sudo apt remove dbconfig-mysql
    7. sudo rm -rf /etc/mysql /var/lib/mysql /var/log/mysql

    Check version: mysql -V

### Install mysql

    1. sudo apt update
    2. sudo apt install mysql-server
    3. sudo systemctl start mysql.service

    after install, we have an error when login:  sudo mysql
    ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)

##### Setting up a password for the root account

    1. sudo mysql
    2. ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345678';

### Restore database

    1. Create database name: classicmodels
    2. Unpack mysqlsampledatabase.zip file
    3. run: pwd to get path of mysqlsampledatabase.sql file
        3.1 /home/longlx/work/github/database/mysqlsampledatabase.sql
    4. sudo mysql -u root -p    (enter passwordd)
    5. run: source path file mysqlsampledatabase.sql
