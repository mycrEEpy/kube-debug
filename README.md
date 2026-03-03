# kube-debug

OCI image for debugging Kubernetes pods.

## Usage

### kubectl

```sh
kubectl debug -it --image=ghcr.io/mycreepy/kube-debug:latest --profile=restricted --namespace=[NAMESPACE] --target=[CONTAINER] [POD]
```

### k9s

Find your k9s plugins location:
```sh
k9s info
```

Add to your plugins.yaml file:
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
      - 'kubectl debug -it --image=ghcr.io/mycreepy/kube-debug:latest --profile=restricted --context=$CONTEXT --namespace=$NAMESPACE --target=$NAME $POD'
```

### fzf alias

Interactive selection of namespace, pod, and container using fzf:

```sh
alias kdebug='NAMESPACE=$(kubectl get namespaces -o jsonpath="{.items[*].metadata.name}" | tr " " "\n" | fzf --prompt="Select namespace: ") && POD=$(kubectl get pods -n "$NAMESPACE" -o jsonpath="{.items[*].metadata.name}" | tr " " "\n" | fzf --prompt="Select pod: ") && CONTAINER=$(kubectl get pod "$POD" -n "$NAMESPACE" -o jsonpath="{.spec.containers[*].name}" | tr " " "\n" | fzf --prompt="Select container: ") && kubectl debug -it --image=ghcr.io/mycreepy/kube-debug:latest --profile=restricted --namespace="$NAMESPACE" --target="$CONTAINER" "$POD"'
```

#### Installing fzf

Windows:

```sh
winget install fzf
```

Linux/macOS:

```sh
brew install fzf
```

or

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
