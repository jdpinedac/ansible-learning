#!/usr/bin/env bash

\cp /vagrant/hosts /etc/hosts

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
