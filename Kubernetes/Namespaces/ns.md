```
kubectl get ns
```
```
kubectl create namespace dev
```
```
kubectl get pods -n default
```
```
kubectl get pods --all-namaspaces
```
```
kubectl config set-context --current --namespace=dev
```
```
kubectl config view --minify | grep namespace:
```
