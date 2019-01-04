#!/usr/bin/env bash

brew update
brew install dnsmasq

touch  $(brew --prefix)/etc/dnsmasq.d/test.conf
echo 'address=/.test/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.d/test.conf
brew services restart dnsmasq

# Add DNS resolver
sudo mkdir -pv /etc/resolver
sudo touch /etc/resolver/test
echo 'nameserver 127.0.0.1' | sudo tee -a /etc/resolver/test
