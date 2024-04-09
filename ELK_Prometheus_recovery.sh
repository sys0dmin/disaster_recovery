# Блок восстановления ELK и Prometheus----------------------------------------------------------------------------------------------
#Копирование конфигураций в конечные каталоги и перезапуск служб
sudo cp -r /home/ivan/disaster_recovery/Monitoring/etc/elasticsearch /etc;
sudo cp -r /home/ivan/disaster_recovery/Monitoring/var/elasticsearch /var/lib;
sudo cp /home/ivan/disaster_recovery/Monitoring/logstash-nginx-es.conf /etc/logstash/conf.d
chown -R elasticsearch:elasticsearch /var/lib/elasticsearch/;
sudo cp /home/ivan/disaster_recovery/Monitoring/filebeat.yml /etc/filebeat/;
sudo cp /home/ivan/disaster_recovery/Monitoring/grafana.db /var/lib/grafana;
sudo cp /home/ivan/disaster_recovery/Monitoring/grafana.ini /etc/grafana;
sudo cp /home/ivan/disaster_recovery/Monitoring/kibana.yml /etc/kibana;
sudo cp /home/ivan/disaster_recovery/Monitoring/logstash.yml /etc/logstash;
sudo cp /home/ivan/disaster_recovery/Monitoring/prometheus.yml /etc/prometheus;
sudo systemctl restart elasticsearch.service kibana.service logstash.service filebeat grafana-server prometheus.service;
# Блок восстановления ELK и Prometheus----------------------------------------------------------------------------------------------
