# kube-debug

OCI image for debugging Kubernetes pods.

## Usage

### kubectl

```sh
kubectl debug -it --image=ghcr.io/mycreepy/kube-debug:latest --namespace=[NAMESPACE] --target=[CONTAINER] [POD]
```

### k9s

```yaml
plugins:
  debug:
    shortCut: Shift-D
    description: Debug
    scopes:
      - containers
    command: bash
    background: false
    args:
      - -c
      - 'kubectl debug -it --image=ghcr.io/mycreepy/kube-debug:latest --context=$CONTEXT --namespace=$NAMESPACE --target=$NAME $POD'
```
