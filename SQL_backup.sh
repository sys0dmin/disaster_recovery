#!/bin/bash

#Блок резервного копирования БД и конфига slave сервера SQL-------------------------------------------------------------------------
# Настройки подключения к серверам MySQL
sql_usr="root"
db1="wp_db"
db2="wp_db_1"

# Сервер и данные для копирования
bkp_srv="mon.mshome.net"
bkp_usr="ivan"
bkp_path="/home/ivan/WP_backup/SQL"

# Создаем временную директорию для бекапа
tmp_bkp_dir="/tmp/backup-$(date +'%Y.%m.%d-%H:%M:%S')"
mkdir $tmp_bkp_dir

# Выполняем резервное копирование баз данных db1 и db2
mysqldump --set-gtid-purged=OFF -u $sql_usr -p $db1 >$tmp_dkp_dir/$db1.sql
mysqldump --set-gtid-purged=OFF -u $sql_usr -p $db2 >$tmp_bkp_dir/$db2.sql

# Архивируем бекап
tar -czvf $tmp_bkp_dir.tar.gz $tmp_bkp_dir

# Копируем архив на удаленный сервер
scp $tmp_bkp_dir.tar.gz $bkp_usr@$bkp_srv:$bkp_path

# Копирование конфигурационных файлов MySQL
scp /etc/mysql/mysql.conf.d/mysqld.cnf $bkp_usr@$bkp_srv:$bkp_path/conf/slave/

# Удаляем временную директорию
rm -rf $tmp_bkp_dir
