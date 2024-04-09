# Блок восстановления ELK и Prometheus----------------------------------------------------------------------------------------------
#Копирование конфигураций в конечные каталоги и перезапуск служб
sudo cp -r /home/ivan/disaster_recovery/Monitoring/elasticsearch /etc;
sudo cp /home/ivan/disaster_recovery/Monitoring/filebeat.yml /etc/filebeat/;
sudo cp /home/ivan/disaster_recovery/Monitoring/grafana.db /var/lib/grafana;
sudo cp /home/ivan/disaster_recovery/Monitoring/grafana.ini /etc/grafana;
sudo cp /home/ivan/disaster_recovery/Monitoring/kibana.yml /etc/kibana;
sudo cp /home/ivan/disaster_recovery/Monitoring/logstash.yml /etc/logstash;
sudo cp /home/ivan/disaster_recovery/Monitoring/prometheus.yml /etc/prometheus;
sudo systemctl restart elasticsearch.service kibana.service logstash.service filebeat grafana-server prometheus.service;
# Блок восстановления ELK и Prometheus----------------------------------------------------------------------------------------------
