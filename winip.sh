#!/bin/bash

# 为 wsl 设置 win host
wsl_hosts_path="/etc/hosts"
win_domain="windows"
win_ip=$(cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}')
if grep -wq "$win_domain" $wsl_hosts_path
then
    echo "Linux系统中,windows域名存在,重新设置映射 Win Ip: $win_ip"
    sed -i "s/.* $win_domain/$win_ip $win_domain/g" $wsl_hosts_path
else
    echo "Linux系统中,windows域名不存在,直接添加 Win Ip: $win_ip"
    echo -e "\n$win_ip $win_domain" >> $wsl_hosts_path
fi