
# A Docker Web Application

This Web Application lets people write comments about anything. The comments are saved in the database.
This Web Application uses flask at the backend and mongoDB database. We use 2 docker containers, one for the flask backend and other for mongoDB database. We use a virtual network connect the two containers. We also utilize docker volume to save the data stored in the database.
The container for running flask backend was configured with port mapping, and an entrypoint option to start the backend, and the container containing mongoDB was configured with a named volume mapped to the database directory, and two environment variables were used to setup the credentials for mongoDB. Both the containers were configured with custom names, a shared virtual network and with detached mode option.




## Requirements

- Windows, Linux or MacOS
- Docker
## Deployment

In order to make the bash files executable, run:

```bash
  chmod +x *app.sh
```

To build the docker images, run:

```bash
  ./prepare-app.sh
```

To start the docker images, run:

```bash
  ./start-app.sh
```

To stop the docker images, run:

```bash
  ./stop-app.sh
```

To delete the docker images, run:

```bash
  ./remove-app.sh
```

## How to use

After running the **./start-app.sh** script, you will see an output containing the address to the web application. Example:  `http://localhost:8084`
