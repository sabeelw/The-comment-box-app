echo "Removing app ..."
docker stop commentapp
docker container rm commentapp -f
docker image rm commentbox -f
docker stop mongoinstance
docker container rm mongoinstance -f
docker image rm mongo -f
docker volume rm mongoData -f 
docker network rm bridgenetwork -f
echo "Removed!!"
