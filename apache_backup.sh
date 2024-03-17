#!/bin/bash

# Адрес и имя пользователя для подключения по SSH
usr="ivan"
host1="back001.mshome.net"
host2="back002.mshome.net"

bkp_path="/home/ivan/WP_backup/Apache"
# Путь к оригинальному и новому конфигурационным файлам
wp_path="/srv"

# Подключаемся к другому серверу и копируем новый конфиг на удаленный сервер
#scp $usr@$host:$config $bkp_path/$host/config
#ssh -t $usr@$host "mkdir $bkp_path/$host/data"
scp -r $usr@$host1:$wp_path $bkp_path/back001/srv
scp -r $usr@$host2:$wp_path $bkp_path/back002/srv

# Выводим сообщение об успешном выполнении скрипта
echo "Конфигурационный файл успешно заменен"
