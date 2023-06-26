
# A Docker Web Application

This Web Application is called commentbox and it lets people write variable length comments about anything, Upload desired pictures (Upto 16MB in size) and mention name of the person who is commenting. The comments, profile pictures and names are saved in the Non-Relational NoSQL database, There is an option to delete the comments as well. This Web Application uses HTML,CSS, Bootstrap for the frontend and Django as the backend and mongoDB as Non-Relational NoSQL database. 

## Architecture

The Web Application is hosted on the azure cloud, we create and configure a group on azure then we create a new registry to upload and store the docker image to run. We use CosmosDB to create the MongoDB database instance and finally we create and configure the container using the image in the registry.

## Requirements

- Windows, Linux or MacOS
- Docker
- Azure CLI
- Azure Credits

## Services Used

- Azure Groups
- Azure Registry
- Azure CosmosDB
- Azure Containers

## Deployment

Make sure you have already configured Azure CLI with your Azure account.

In order to make the bash files executable, run:

```bash
  chmod +x *app.sh
```

To build the image and configure the app on the azure cloud service, run:

```bash
  ./prepare-app.sh
```

To stop and remove the webapp from the azure cloud, run:

```bash
  ./remove-app.sh
```

## How to use

After running the **./prepare-app.sh** script, you will see an output containing the address to the web application. Example:  `http://****.nameofgroup.azure.io`
