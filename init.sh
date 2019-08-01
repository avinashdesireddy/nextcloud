#!/bin/bash

##########################################
### Author: Avinash Desireddy
### Github Handle: avinashdesireddy
##########################################

echo ""
echo "This script will initialize necessary docker secrets to setup nextcloud"
echo ""
echo "Nextcloud uses MYSQL Backend. Initialize Credentials. The credentials are stored in docker secrets."
[ -z "$MYSQL_ROOT_PASSWORD" ] && read -s -p "MySQL Root Password:" MYSQL_ROOT_PASSWORD
[ -z "$NEXTCLOUD_DB_NAME" ] && read -p "Nextcloud Database Name:" NEXTCLOUD_DB_NAME
[ -z "$NEXTCLOUD_DB_USER" ] && read -p "Nextcloud Database User:" NEXTCLOUD_DB_USER
[ -z "$NEXTCLOUD_DB_PASSWORD" ] && read -s -p "Nextcloud database Password:" NEXTCLOUD_DB_PASSWORD

echo "Creating docker secrets..."
printf "${MYSQL_ROOT_PASSWORD}" | docker secret create mysql_root_passwd -
printf "${NEXTCLOUD_DB_PASSWORD}" | docker secret create nextcloud_db_pass -
printf "${NEXTCLOUD_DB_NAME}" | docker secret create nextcloud_db_name -
printf "${NEXTCLOUD_DB_PASSWORD}" | docker secret create nextcloud_db_passwd -

echo "Redeploying stack..."
docker stack deploy -c nextcloud-deploy.yaml nextcloud 
