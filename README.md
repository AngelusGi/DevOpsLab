# DevOpsLab
execute ``set-pwsh-auth-terraform.ps1`` powershell script to set all env variables

terraform init --backend=true -backend-config=".\backend.tfvars"

terraform plan --out="xyz.plan" --var-file=".\terraform.tfvars" --var-file=".\auth.tfvars"