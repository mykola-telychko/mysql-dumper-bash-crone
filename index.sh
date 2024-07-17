#!/bin/bash

# dump for the previous two months

# crontab string-command
# 30 1 1,15 * *  /bin/bash -c "/var/www/dumper/index.sh" > /var/log/test.log 2>&1
# */1 * * * *    /bin/bash -c "/var/www/dumper/index.sh" > /var/log/test.log 2>&1

PREV_MONTH=$(date --date='-2 month' "+%F")
EXPIREDUMP=${PREV_MONTH::-3}

mysqldump -uUsrSQL -p'pass' -h127.0.0.1 nameDb1 > /var/www/dumper/nameDb1$(date +%F).sql

mysqldump -uUsrSQL -p'pass' -h127.0.0.1 nameDb2 > /var/www/dumper/nameDb2$(date +%F).sql

mysqldump -uUsrSQL -p'pass' -h127.0.0.1 nameDb3 > /var/www/dumper/nameDb3$(date +%F).sql

mysqldump -uUsrSQL -p'pass' -h127.0.0.1 nameDb4 > /var/www/dumper/nameDb4$(date +%F).sql


find /var/www/dumper/ -type f -name "*$EXPIREDUMP*" -delete
