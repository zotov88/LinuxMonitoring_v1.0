#!/bin/bash

function getInfo {
    echo "HOSTNAME = $(cat /proc/sys/kernel/hostname)"
    echo "TIMEZONE = $(cat /etc/timezone) $(date +"UTC %-:::z")"
    echo "USER = $USER"
    echo "OS = $(cat /etc/issue.net)"
    echo "DATE = $(date +"%d %B %Y %T")"
    echo "UPTIME = $(uptime -p)"
    echo "UPTIME_SEC = $(awk '{print int ($1)}' /proc/uptime)"
    echo "IP = $(hostname -I | awk '{print $1}')"
    echo "MASK = $(netstat -r | tail -n 1 | awk '{print $3}')"
    echo "GATEWAY = $(ip route | grep default | awk '{print $3}')"
    echo "RAM_TOTAL = $(bc<<<"scale=3;($(free -m | grep Mem | awk '{print $2}') / 1024)")"
    echo "RAM_USED = $(bc<<<"scale=3;($(free -m | grep Mem | awk '{print $3}') / 1024)")"
    echo "RAM_FREE = $(bc<<<"scale=3;($(free -m | grep Mem | awk '{print $4}') / 1024)")"
    echo "SPACE_ROOT = $(bc<<<"scale=2;($(df /root | tail -n 1 | awk '{print $2}') / 1024)")"
    echo "SPACE_ROOT_USED = $(bc<<<"scale=2;($(df /root | tail -n 1 | awk '{print $3}') / 1024)")"
    echo "SPACE_ROOT_FREE = $(bc<<<"scale=2;($(df /root | tail -n 1 | awk '{print $4}') / 1024)")"
}

function yesOrNot {
    if [[ $1 == "y" || $1 == "Y" ]]; then
        return 0
    else
        return 1
    fi
}
