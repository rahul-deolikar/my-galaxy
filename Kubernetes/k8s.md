To Create pod, Rc, Rs, Deployment, Service, etc used this command.

``` 
kubectl create -f <resource-name>
```

``` 
kubectl apply -f <resource-name>
```

To check pods status
```
kubectl get pods
```

```
kubectl get pod <pod-name>
```

```
kubectl get pods -o wide
```

To Check Pods Labels

```
kubectl get pods --show-labels
```

To Edit or Modify Pod

```
kubectl edit pod <pod-name>
```

To go insude the pod

```
kubectl exec <pod-name> bash
```

```
kubectl exec <pod-name> -c <container-name> -it bash
```

Expose Service 

```
kubectl expose <pod-name> --port=8000 --target-port=80 --name <service-name/myfstservice>
```
To check services

```
kubectl get service
```
```
kubectl get svc
```

To expose Nodeport(service)

```
kubectl expose <pod-name> --type=NodePort --port=8000 --target-port=80 --name <service-nm/myservice>
```
To check service status

```
kubectl get svc
```
