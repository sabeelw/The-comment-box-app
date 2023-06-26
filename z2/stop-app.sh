echo "deleting Kube Yaml"
kubectl delete -f statefulset.yaml -n webapp
kubectl delete -f deployment.yaml -n webapp
kubectl delete -f service.yaml -n webapp
kubectl delete -f namespace.yaml
echo "Done"
