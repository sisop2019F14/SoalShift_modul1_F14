#!/bin/bash

awk 'tolower($0) ~ /cron/ , !/sudo/ {if (NF < 13)print}' /var/log/syslog > /home/anwar/modul1/user.log
