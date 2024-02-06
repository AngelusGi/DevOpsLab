# DevOpsLab
execute ``set-pwsh-auth-terraform.ps1`` powershell script to set all env variables

terraform init --backend=true -backend-config=".\backend.tfvars"

terraform plan --out="xyz.plan" --var-file=".\terraform.tfvars" --var-file=".\auth.tfvars"

---

podman build --tag angelusgi/apidemo:0.0.5 -f Dockerfile
podman push  angelusgi/apidemo:0.0.5
podman login -u -p 