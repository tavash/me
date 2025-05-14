# Terragrunt
alias tg="terragrunt"
alias tgfmt="tg hclfmt"
alias tgi="tgfmt && tg init"
alias tgI="tgfmt && tg init -upgrade"
alias tgp="tgfmt && tg plan"
alias tgP="tgfmt && tg init -upgrade && tg plan"
alias tga="tgfmt && tg apply"
alias tgA="tgfmt && tg apply -auto-approve"
alias tgd="tgfmt && tg destroy"
alias tgD="tgfmt && tg destroy -auto-approve"
alias TGFMT="find . -iname '*.hcl' -exec terragrunt hclfmt {} \;"
alias tgclean='rm -Rf .terragrunt-cache .terraform.lock.hcl'

# Terraform
alias tf="terraform"
alias tffmt="tf fmt"
alias tfi="tffmt && tf init"
alias tfi="tffmt && tf init -upgrade"
alias tfp="tffmt && tf plan"
alias tfa="tffmt && tf apply"
alias tfA="tffmt && tf apply -auto-approve"
alias tfd="tffmt && tf destroy"
alias tfD="tffmt && tf destroy -auto-approve"
alias TFFMT="find . -iname '*.tf' -exec terraform fmt {} \;"

alias RMTGCACHE="find . -iname '.terragrunt-cache' -exec rm -Rf {} \;"
alias RMTGLOCK="find . -iname '.terragrunt-cache' -exec rm -Rf {} \;"

# Kubernetes
alias k='kubectl'
alias kex='kubectl exec -i -t'
alias klo='kubectl logs -f'
alias kpf='kubectl port-forward'
alias kg='kubectl get'
alias kd='kubectl describe'
alias krm='kubectl delete'
alias klpo='kubectl get pod'
alias kgpo='kubectl get pod -o=yaml'
alias kldep='kubectl get deployment'
alias kgdep='kubectl get deployment -o=yaml'
alias klsvc='kubectl get service'
alias kgsvc='kubectl get service -o=yaml'
alias kling='kubectl get ingress'
alias kging='kubectl get ingress -o=yaml'
alias klcm='kubectl get configmap'
alias kgcm='kubectl get configmap -o=yaml'
alias klsec='kubectl get secret'
alias kgsec='kubectl get secret -o=yaml'
alias kev='kubectl get events --sort-by='.lastTimestamp''

alias kn='kubens'
alias kx='kubectx'

# Docker
alias dk='docker'
alias dkb='docker build'
alias dke='docker exec'
alias dki='docker images'
alias dkl='docker logs'
alias dkL='docker logs -f'
alias dkps='docker ps -a'
alias dkpl='docker pull'
alias dkph='docker push'
alias dkr='docker run'
alias dkR='docker run -it --rm'
alias dkRM='docker system prune'
alias dkrm='docker rm'
alias dkrmi='docker rmi'

# Docker compose
# alias dkc='docker-compose'
alias dkc='docker compose'
alias dkcu='docker compose up'
alias dkcd='docker compose down'

# Hunt down disk space hogs
alias ducks="du -m * | sort -rn | head"
