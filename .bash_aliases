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

# Terraform
alias tf="terraform"
alias tffmt="tf fmt"
alias tfi="tffmt && tf init"
alias tfp="tffmt && tf plan"
alias tfa="tffmt && tf apply"
alias tfA="tffmt && tf apply -auto-approve"
alias tfd="tffmt && tf destroy"
alias tfD="tffmt && tf destroy -auto-approve"
alias TFFMT="find . -iname '*.tf' -exec terraform fmt {} \;"
