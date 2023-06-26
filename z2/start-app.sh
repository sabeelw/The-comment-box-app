echo "Running Kube Yaml"
kubectl apply -f namespace.yaml
kubectl apply -f statefulset.yaml -n webapp
kubectl apply -f deployment.yaml -n webapp
kubectl apply -f service.yaml -n webapp
echo "You can access the Web Application at : $(minikube ip):30015"
echo "Done running"
