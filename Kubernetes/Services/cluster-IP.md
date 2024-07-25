Deployment1.yaml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-1
spec:
  replicas: 2
  selector:
    matchLabels:
      app: app-1
  template:
    metadata:
      labels:
        app: app-1
    spec:
      containers:
      - name: app-1-container
        image: nginx
        ports:
          - containerPort: 80
```


Cluster-IP-1.yaml
```
  apiVersion: v1
kind: Service
metadata:
  name: apps-1-service
spec:
  selector:
    app: app-1
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
```


Deployment2.yaml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-2
spec:
  replicas: 2
  selector:
    matchLabels:
      app: app-2
  template:
    metadata:
      labels:
        app: app-2
    spec:
      containers:
      - name: app-2-container
        image: nginx
        ports:
          - containerPort: 80
```


Cluster-IP-2.yaml

```
apiVersion: v1
kind: Service
metadata:
  name: app-2-service
spec:
  selector:
    app: app-2
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
```



**apply deployment and service files**

```
kubectl apply -f deployment1.yaml
```

```
kubectl apply -f Cluster-IP-1.yaml
```

**check deployment and services**

```
kubectl get deployment
```

```
kubectl get svc
```

**kubectl get pod**

```
kubectl get pod
```

**Now lats access  service 2 from pod 1**

```
kubectl exce -it <pod1-name> -- /bin/bash
```

```
curl http: //<service-2-ip-or-name>:80 
