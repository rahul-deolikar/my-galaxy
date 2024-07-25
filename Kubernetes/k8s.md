To Create pod, Rc, Rs, Deployment, Service, etc used this command.
```kubectl create -f <resource-name>```
```kubectl apply -f <resource-name>```

To check pods status
```kubectl get pods```
```kubectl get pod <pod-name>```
```kubectl get pods -o wide```

To Check Pods Labels
```kubectl get pods --show-labels```

To Edit or Modify Pod
```kubectl edit pod <pod-name>
