# # # PowerShell
Set-Variable -Name '$env:ARM_CLIENT_ID' -Value "00000000-0000-0000-0000-000000000000"
Set-Variable -Name '$env:ARM_CLIENT_SECRET' -Value "12345678-0000-0000-0000-000000000000"
Set-Variable -Name '$env:ARM_TENANT_ID' -Value "10000000-0000-0000-0000-000000000000"
Set-Variable -Name '$env:ARM_SUBSCRIPTION_ID' -Value "20000000-0000-0000-0000-000000000000"

$varList = @('$env:ARM_CLIENT_ID', '$env:ARM_CLIENT_SECRET', '$env:ARM_TENANT_ID', '$env:ARM_SUBSCRIPTION_ID')

foreach ($envVar in $varList) {
    if ( [string]::IsNullOrEmpty((Get-Variable -Name $envVar -ValueOnly -ErrorAction SilentlyContinue))) {
        Write-Error "Variable $($envVar) not set."
    }
}
