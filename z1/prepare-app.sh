#!/bin/sh
myregistry='sabeelwani'
mongo_service='mongo-db-instance'
app_name='commentapp'
location='polandcentral'
resourceGroupName='swgroup'
echo "Preparing app ..."
docker network create bridgenetwork
docker build -t commentbox .
echo "Preparation complete ..."


