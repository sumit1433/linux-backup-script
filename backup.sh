#!/bin/bash

echo "This script takes backup of /tmp"

tar -zcf /source/backup_of_tmp_$(date +%F_%H-%M-%S).tar.gz /tmp 2>/dev/null

if [ $? -eq 0 ]
then
    echo "Backup successful"
else
    echo "Backup failed"
    exit 1
fi

echo "Now syncing with remote server"

rsync -avz /source/ 172.16.0.100:/remote/dist/

if [ $? -eq 0 ]
then
    echo "Backup and syncing successful"
else
    echo "Sync failed"
fi

exit

