#!/usr/bin/env bash

# Input parameters
bootstrap_expect="$1"
consul_join_tag_key="$2"
consul_join_tag_value="$3"
consul_encrypt="$4"

# Sets the hostname of the node
internalIP=$$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
instanceID=$$(curl http://169.254.169.254/latest/meta-data/instance-id)
hostname="consul-$${instanceID#*-}"

sudo hostname $$hostname
cat << EOF >> /etc/hosts
127.0.0.1 $hostname
EOF

# Create start script for Consul
cat << EOF >> /tmp/consul.service
[Unit]
Description=Consul agent server
Requires=network-online.target
After=network-online.target

[Service]
EnvironmentFile=-/etc/sysconfig/consul
Environment=GOMAXPROCS=2
Restart=on-failure
ExecStart=/usr/local/bin/consul agent -config-dir /etc/consul.d/server
ExecReload=/bin/kill -HUP $MAINPID
ExecStop=/usr/local/bin/consul leave

[Install]
WantedBy=multi-user.target
EOF

sudo mv /tmp/consul.service /etc/systemd/system/consul.service
sudo chown root:root /etc/systemd/system/consul.service

# Create Consul configuration file and
# copy it to the proper folder
cat << EOF >> /tmp/consul.json
{
    "server": true,
    "bootstrap_expect": ${bootstrap_expect},
    "datacenter": "dc1",
    "data_dir": "/var/consul",
    "encrypt": "${consul_encrypt}",
    "log_level": "TRACE",
    "retry_join": ["provider=aws tag_key=${consul_join_tag_key} tag_value=${consul_join_tag_value}"],
    "enable_syslog": true,
    "client_addr": "0.0.0.0",
    "ui": true
}
EOF

sudo mkdir -p /etc/consul.d/server
sudo mv /tmp/consul.json /etc/consul.d/server/consul.json

sudo mkdir /var/consul
sudo chown root:root /var/consul

sudo consul agent -config-dir /etc/consul.d/server
