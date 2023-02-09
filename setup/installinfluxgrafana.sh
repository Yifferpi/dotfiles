#! /bin/bash

# this script installs InfluxDB and Grafana Dashboard on a Raspberry pi


# InfluxDB
# [Tutorial](https://linuxhint.com/install-influxdb-raspberry-pi/)

curl https://repos.influxdata.com/influxdb.key | gpg --dearmor | sudo tee /usr/share/keyrings/influxdb-archive-keyring.gpg >/dev/null

echo "deb [signed-by=/usr/share/keyrings/influxdb-archive-keyring.gpg] https://repos.influxdata.com/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

# install influxdb
sudo apt update
sudo apt install influxdb

# start and enable influxdb
sudo systemctl unmask influxdb
sudo systemctl enable influxdb
sudo systemctl start influxdb

# Grafana
# [Tutorial](https://grafana.com/tutorials/install-grafana-on-raspberry-pi/)

# add apt key
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
# add repository to sources.list
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# install grafana
sudo apt-get update
sudo apt-get install -y grafana

# start and enable grafana
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

echo "Type 'influx' to enter the InfluxDB shell."
