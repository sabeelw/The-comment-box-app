
# A Comment Web Application

This Web Application lets people write comments about anything, Upload desired pictures and mention name of the commenter. The comments including the profile pictures and names are saved in the database.
This Web Application uses Django as the backend and mongoDB NoSQL database to store the messages, names and profile picture. 

# Architecture

We deploy 2 seperate pods, one containing for the Django backend and other containing the MongoDB database. We use service ClusterIP to assign an port mapped IP to mongoDB containing pod, and a LoadBalancer service to expose the Django WebApplication to external networks. We also utilize Kubernetes Persistant Volume and Persistant Volume Claims to save the data stored in the mongoDB database. The Deployments, Services and Stateful Set share the same namespace.



## Requirements

- Windows, Linux or MacOS
- Docker
- Kubectl
- Minikube
## Deployment

In order to make the bash files executable, run:

```bash
  chmod +x *app.sh
```

To build the docker images, run:

```bash
  ./prepare-app.sh
```

To create deployment and start the docker images inside the pod, run:

```bash
  ./start-app.sh
```

To remove pods, service and volume instances, run:

```bash
  ./stop-app.sh
```



## How to use

After running the **./start-app.sh** script, you will see an output containing the address to the web application. Example:  `http://192.168.59.100:8000`
