#!/bin/bash

# Адрес и имя пользователя для подключения по SSH
usr="ivan"
host="front.mshome.net"
# Путь к конфигу
config="/etc/nginx/conf.d/load-balancer.conf"
bkp_path="/home/ivan/WP_backup/Nginx"

# Подключаемся к другому серверу и копируем новый конфиг на удаленный сервер
scp $usr@$host:$config $bkp_path

# Выводим сообщение об успешном выполнении скрипта
echo "Конфигурационный файл успешно заменен"
