#!/bin/bash

# Файлы конфигов для копирования
kibana="/etc/kibana/kibana.yml"
elastic="/etc/elasticsearch/elasticsearch.yml"
logstash="/etc/logstash/logstash.yml"
prometheus="/etc/prometheus/prometheus.yml"
filebeat="/etc/filebeat/filebeat.yml"
grafana="/var/lib/grafana/grafana.db"

#Остановка Grafana
systemctl stop grafana-server

#Цикл опирования конфигов в папку с бекапами
files=("$kibana" "$elastic" "$logstash" "$prometheus" "$filebeat" "$grafana")

for file in "${files[@]}"
do
    cp "$file" /home/ivan/WP_backup/Monitoring
done
#Запуск Grafana
systemctl start grafana-server

echo "Конфигурационные файлы скопированы"
