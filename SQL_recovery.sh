# Блок восстановления SQL-master----------------------------------------------------------------------------------------------------
# Переменные для подключения к серверу
host_sql="sql-master.mshome.net"
cfg_sql="/home/ivan/disaster_recovery/SQL/conf/master/mysqld.cnf"
db_sql="/home/ivan/disaster_recovery/SQL/*.tar.gz"

#Запрос логина и пароля
echo "Введите логин для подключения к серверу $host_sql "
read -s usr

echo "Введите пароль для подключения к серверу $host_sql "
read -s pass

#Копирование конфигураций с удалённого сервера
sshpass -p $pass scp -r $cfg_sql $usr@$host_sql:/home/ivan/
sshpass -p $pass scp -r $db_sql $usr@$host_sql:/home/ivan/

#Копирование конфигураций в конечные каталоги, восстановление БД и перезапуск служб
sshpass -p $pass ssh -t $usr@$host_sql "
sql_pass='113525'
sql_user='root'
sudo cp /home/ivan/mysqld.cnf /etc/mysql/mysql.conf.d;

tar xzvf /home/ivan/*.tar.gz

sudo mysql -e \"ALTER USER 'root'@'localhost' IDENTIFIED WITH 'caching_sha2_password' BY '113525'\"
mysql -u root -p113525 -e \"CREATE DATABASE wp_db\"
mysql -u root -p113525 -e \"CREATE DATABASE wp_db_1\"
mysql -u root -p113525 -e \"CREATE USER wp_user@'%' IDENTIFIED BY '113525'\"
mysql -u root -p113525 -e \"GRANT ALL PRIVILEGES ON wp_db.* TO wp_user@'%'\"
mysql -u root -p113525 -e \"GRANT ALL PRIVILEGES ON wp_db_1.* TO wp_user@'%'\"
mysql -u root -p113525 wp_db < /home/ivan/tmp/backup-20240316115116/wp_db.sql
mysql -u root -p113525 wp_db_1 < /home/ivan/tmp/backup-20240316115116/wp_db_1.sql
"
