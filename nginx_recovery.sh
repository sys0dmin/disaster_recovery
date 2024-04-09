#!/bin/bash
# Блок восстановления NGINX---------------------------------------------------------------------------------------------------------
# Переменные для подключения к серверу
host_front="front.mshome.net"
config_folder="/home/ivan/disaster_recovery/Nginx/"
config_nginx="/home/ivan/disaster_recovery/Nginx/load-balancer.conf"
config_filebit="/home/ivan/disaster_recovery/Nginx/filebeat.yml"

#Запрос логина и пароля
echo "Введите логин для подключения к серверу $host "
read -s usr

echo "Введите пароль для подключения к серверу $host "
read -s pass

#Копирование конфигураций с удалённого сервера
sshpass -p$pass scp -r -p $config_folder $usr@$host_front:/home/ivan/

#Копирование конфигураций в конечные каталоги и перезапуск служб
sshpass -p$pass ssh -t $usr@$host_front "

sudo cp /home/ivan/Nginx/load-balancer.conf /etc/nginx/conf.d/;
sudo cp /home/ivan/Nginx/filebeat.yml /etc/filebeat/;
sudo systemctl restart nginx;
"
# Блок восстановления NGINX---------------------------------------------------------------------------------------------------------
