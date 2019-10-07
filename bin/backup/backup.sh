#!/bin/bash
PROJECT=documentation

DATE=`date +%Y-%m-%d:%H:%M:%S`
PROJECTS_ROOT=/var/www/chebrowser
BACKUP_PATH=/home/$USER/data/project-backups/chebrowser/$PROJECT/$DATE
ARCHIVE_PATH=$BACKUP_PATH.tar.gz


echo "Создание резервной копии проекта: $PROJECT"
echo "Текущая дата: $DATE"

mkdir -p $BACKUP_PATH
mkdir $BACKUP_PATH/source



echo "Копирование файлов проекта: $PROJECTS_ROOT/$PROJECT"
cp -R $PROJECTS_ROOT/$PROJECT $BACKUP_PATH/source


echo "Архивация данных"
tar -zcf $ARCHIVE_PATH $BACKUP_PATH


echo "Удаление временных файлов"
rm -rf $BACKUP_PATH/


FILESIZE=$((  $(stat -c%s "$ARCHIVE_PATH") / 1024 / 1024 ))
echo "Размер архива: $FILESIZE MB"
