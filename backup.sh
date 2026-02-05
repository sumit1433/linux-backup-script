#!/bin/bash

echo "**This script take backup of /tmp everyday at 20:00pm*"

tar -zcf /source/backup_of_tmp-$(date +%A%y%m%d%H%M%S).tar.gz /tmp 2>/dev/null
sleep 2

echo "**backup successful**"

echo *********NOW SYNCING WITH REMOTE SERVER********

rsync -a /source/* 172.16.0.100:/remote/dist/
sleep 2

echo "**backup and syncing both successful**"

exit

