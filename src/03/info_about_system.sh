#!/bin/bash

function getInfo {
    COLOR_BACK1=$(getBackgroundColor $1)
    COLOR_FONT1=$(getFontColor $2)
    COLOR_BACK2=$(getBackgroundColor $3)
    COLOR_FONT2=$(getFontColor $4)
    COLOR_DEFAULT="\033[0m"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}HOSTNAME = ${COLOR_BACK2}${COLOR_FONT2}$(cat /proc/sys/kernel/hostname)${NORMAL}${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}TIMEZONE = ${COLOR_BACK2}${COLOR_FONT2}$(cat /etc/timezone) $(date +"UTC %-:::z")${NORMAL}${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}USER = ${COLOR_BACK2}${COLOR_FONT2}$USER${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}OS = ${COLOR_BACK2}${COLOR_FONT2}$(cat /etc/issue.net)${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}DATE = ${COLOR_BACK2}${COLOR_FONT2}$(date +"%d %B %Y %T")${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}UPTIME = ${COLOR_BACK2}${COLOR_FONT2}$(uptime -p)${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}UPTIME_SEC = ${COLOR_BACK2}${COLOR_FONT2}$(awk '{print int ($1)}' /proc/uptime)${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}IP = ${COLOR_BACK2}${COLOR_FONT2}$(hostname -I | awk '{print $1}')${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}MASK = ${COLOR_BACK2}${COLOR_FONT2}$(netstat -r | tail -n 1 | awk '{print $3}')${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}GATEWAY = ${COLOR_BACK2}${COLOR_FONT2}$(ip route | grep default | awk '{print $3}')${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}RAM_TOTAL = ${COLOR_BACK2}${COLOR_FONT2}$(bc<<<"scale=3;($(free -m | grep Mem | awk '{print $2}') / 1024)")${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}RAM_USED = ${COLOR_BACK2}${COLOR_FONT2}$(bc<<<"scale=3;($(free -m | grep Mem | awk '{print $3}') / 1024)")${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}RAM_FREE = ${COLOR_BACK2}${COLOR_FONT2}$(bc<<<"scale=3;($(free -m | grep Mem | awk '{print $4}') / 1024)")${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}SPACE_ROOT = ${COLOR_BACK2}${COLOR_FONT2}$(bc<<<"scale=2;($(df /root | tail -n 1 | awk '{print $2}') / 1024)")${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}SPACE_ROOT_USED = ${COLOR_BACK2}${COLOR_FONT2}$(bc<<<"scale=2;($(df /root | tail -n 1 | awk '{print $3}') / 1024)")${COLOR_DEFAULT}"
    echo -e "${COLOR_BACK1}${COLOR_FONT1}SPACE_ROOT_FREE = ${COLOR_BACK2}${COLOR_FONT2}$(bc<<<"scale=2;($(df /root | tail -n 1 | awk '{print $4}') / 1024)")${COLOR_DEFAULT}"
}

function getBackgroundColor {
    if [[ $1 == 1 ]]; then
        echo "\033[47m"
        elif [[ $1 == 2 ]]; then
        echo "\033[41m"
        elif [[ $1 == 3 ]]; then
        echo "\033[42m"
        elif [[ $1 == 4 ]]; then
        echo "\033[44m"
        elif [[ $1 == 5 ]]; then
        echo "\033[45m"
        elif [[ $1 == 6 ]]; then
        echo "\033[40m"
    fi
}

function getFontColor {
    if [[ $1 == 1 ]]; then
        echo "\033[37m"
        elif [[ $1 == 2 ]]; then
        echo "\033[31m"
        elif [[ $1 == 3 ]]; then
        echo "\033[32m"
        elif [[ $1 == 4 ]]; then
        echo "\033[34m"
        elif [[ $1 == 5 ]]; then
        echo "\033[35m"
        elif [[ $1 == 6 ]]; then
        echo "\033[30m"
    fi
}

function yesOrNot {
    if [[ $1 == "y" || $1 == "Y" ]]; then
        return 0
    else
        return 1
    fi
}
