# Блок восстановления Apache--------------------------------------------------------------------------------------------------------
# Переменные для подключения к серверу
host="back001.mshome.net"
cfg_apache="/home/ivan/disaster_recovery/Apache/back001/wordpress.conf"
wd_apache="/"
bd_apache="/home/ivan/disaster_recovery/Apache/back001/"
cfg_path_apache="/etc/apache2/sites-available"

#Запрос логина и пароля
echo "Введите логин для подключения к серверу $host "
read -s usr

echo "Введите пароль для подключения к серверу $host "
read -s pass

#Копирование конфигураций с удалённого сервера
sshpass -p $pass scp -r $bd_apache $usr@$host:/home/ivan/
sshpass -p $pass scp -r $cfg_apache $usr@$host:/home/ivan/

#Копирование конфигураций в конечные каталоги и перезапуск служб
sshpass -p $pass ssh -t $usr@$host "
sudo mkdir -p /srv/www
sudo chown www-data: /srv/www
sudo cp -r /home/ivan/back001/srv/www/wordpress /srv/www;
sudo rm /etc/apache2/sites-available/*
sudo rm /etc/apache2/sites-enabled/*
sudo cp /home/ivan/back001/wordpress.conf /etc/apache2/sites-available/
sudo ln -s /etc/apache2/sites-available/wordpress.conf /etc/apache2/sites-enabled/wordpress.conf
sudo systemctl restart apache2;
"
