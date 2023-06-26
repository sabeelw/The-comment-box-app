echo "Running app ..."
docker run -d --network bridgenetwork -v mongoData:/data/db --name mongoinstance \
	-e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
	-e MONGO_INITDB_ROOT_PASSWORD=secret \
	mongo
echo "You can access the database using mongoInstance.bridgeNetwork with username mongoadmin and password secret"
docker run -d --name commentapp -p 8084:8000 --network bridgenetwork \
 -e MONGO_CONNECTIONSTRING="mongodb://mongodb-43121:CUPhMi10lXVrAwC22zSOtTa4LgY3cYwwhZKwOMghffU17EOOLEsSvnyk71AL79gltNR9hBAz2TokACDb72fC8Q==@mongodb-43121.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@mongodb-43121@" commentbox
echo "You can access the webapp at http://localhost:8084"
