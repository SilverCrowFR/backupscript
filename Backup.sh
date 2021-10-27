#!/usr/bin/bash

#declaration variables spécifique
FQDN=blog.di21.fr
destination_backup=/backup
vhost_path=/etc/apache2/site-enabled
backup_file=$destination_backup/backup_$FQDN"_"$today.tar.gz
vhost=/etc/apache2/site-enabled/wordpress.conf
website_files=/var/www/$FQDN
db_name=wordpress
db_login=wordpress
db_pwd=***
echo $db_name"_"$today
db_backupfile=$destination_backup/export_$db_name"_"$today.sql
today=$(date +%Y-%m-d)

echo $today

#export db
mysqldump -u $db_login -p$db_pwd $db_name > $db_backupfile

#création archive
tar -czvf $backup_file $vhost $website_files $db_backupfile

#clean export db
rm $db_backupfile
