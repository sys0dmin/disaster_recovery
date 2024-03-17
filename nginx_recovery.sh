#!/bin/bash
# Блок восстановления NGINX--------------------------------------------------------------------------------------------
# Переменные для подключения к серверу
host_front="front.mshome.net"
config_nginx="/home/ivan/disaster_recovery/Nginx/load-balancer.conf"
config_filebit="путь_к_файлу_для_копирования"
config_path_nginx="/etc/nginx/conf.d"
config_path_filebit="путь_к_целевой_директории_на_сервере"

#Запрос логина и пароля
echo "Введите логин для подключения к серверу $host "
read -s usr

echo "Введите пароль для подключения к серверу $host "
read -s pass

#Копирование конфигураций с удалённого сервера
sshpass -p$pass scp -p $config_nginx $usr@$host_front:/home/ivan/

#Копирование конфигураций в конечные каталоги и перезапуск служб
sshpass -p$pass ssh -t $usr@$host_front "
sudo cp /home/ivan/load-balancer.conf /etc/nginx/conf.d/;
sudo systemctl restart nginx;
"
# Блок восстановления NGINX--------------------------------------------------------------------------------------------

# Блок восстановления Apache--------------------------------------------------------------------------------------------------------
# Переменные для подключения к серверу
host_back001="back001.mshome.net"
config_apache="/home/ivan/disaster_recovery/Apache/wordpress.conf"
work_dir_apache="/"
backup_dir_apache="/home/ivan/disaster_recovery/Apache/back001.mshome.net/"
config_path_apache="/etc/apache2/sites-available"


#Копирование конфигураций с удалённого сервера
sshpass -p$pass scp -p $backup_dir_apache $usr@$host_back001:/home/ivan/
sshpass -p$pass scp -p $config_apache $usr@$host_back001:/home/ivan/

#Копирование конфигураций в конечные каталоги и перезапуск служб
sshpass -p$pass ssh -t $usr@$host_back001 "
sudo cp /home/ivan/srv $work_dir_apache;
sudo cp /home/ivan/wordpress.conf $config_path_apache
ln $config_path_apache/wordpress.conf /etc/apache2/sites-enabled/wordpress.conf
sudo systemctl restart apache2;
"
