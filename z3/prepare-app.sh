#!/bin/sh
myregistry="swreg"
app_name="commentapp"
location="switzerlandnorth"
app_container="appcon"
dns_label_app="commentwebapp"
rand=$(shuf -i 100-999 -n 1)
mongo_service="mongo-db-"
mongo_service="${mongo_service}${rand}"
resourceGroupName="swgroup"
myregistry="${myregistry}${rand}"
app_container="${app_container}${rand}"
echo "Preparing app ..."
docker build -t commentbox .
echo "Preparation complete ..."


echo "Creating group"
az group create --name $resourceGroupName --location $location
az acr create --resource-group $resourceGroupName --name $myregistry --sku basic
az acr login --name $myregistry

az acr update -n $myregistry --admin-enabled true


echo "Uploading Image to Registry"
docker tag commentbox:latest  $myregistry.azurecr.io/commentbox:latest  
docker push $myregistry.azurecr.io/commentbox:latest

echo "Creating MongoDB Instance"
az cosmosdb create --resource-group $resourceGroupName --name $mongo_service --locations regionName=$location --kind MongoDB
    
connectionString=$(az cosmosdb keys list --type connection-strings --resource-group $resourceGroupName --name $mongo_service --output tsv --query connectionStrings[0].connectionString)
user=$(az acr credential show --name $myregistry --output tsv --query username)
pass=$(az acr credential show --name $myregistry --output tsv --query passwords[0].value)
echo $resourceGroupName
echo $connectionString
echo $user
echo $myregistry
echo $pass
echo "Creating Webapp Instance"

az container create --resource-group $resourceGroupName --name $app_container --image $myregistry.azurecr.io/commentbox:latest --dns-name-label $dns_label_app --ports 80 --environment-variables MONGO_CONNECTIONSTRING=$connectionString --registry-username $user --registry-password $pass --restart-policy OnFailure
