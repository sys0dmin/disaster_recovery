#!/bin/bash

# Адрес и имя пользователя для подключения по SSH
usr="ivan"
host1="back001.mshome.net"
host2="back002.mshome.net"

bkp_path="/home/ivan/disaster_recovery/Apache"
# Путь к оригинальному и новому конфигурационным файлам
wp_path="/srv"
wp_conf="/etc/apache2/sites-available/wordpress.conf"

# Подключаемся к другому серверу и копируем новый конфиг на удаленный сервер
#scp $usr@$host:$config $bkp_path/$host/config
#ssh -t $usr@$host1 sudo mkdir /home/ivan/disaster_recovery/Apache/back001
#ssh -t $usr@$host2 sudo mkdir $bkp_path/back002
scp -r $usr@$host1:$wp_conf $bkp_path/back001/
scp -r $usr@$host2:$wp_conf $bkp_path/back002/
scp -r $usr@$host1:$wp_path $bkp_path/back001
scp -r $usr@$host2:$wp_path $bkp_path/back002

# Выводим сообщение об успешном выполнении скрипта
echo "Конфигурационный файл успешно заменен"
