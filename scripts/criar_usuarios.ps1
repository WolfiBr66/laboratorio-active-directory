Import-Module ActiveDirectory

$usuarios = Import-Csv "$env:USERPROFILE\Desktop\usuarios.csv"

foreach ($u in $usuarios) {
    New-ADUser -Name $u.Nome `
        -SamAccountName $u.Login `
        -UserPrincipalName "$($u.Login)@dominio.local" `
        -Path "OU=Usuarios,DC=dominio,DC=local" `
        -AccountPassword (ConvertTo-SecureString "Senha@123" -AsPlainText -Force) `
        -Enabled $true
    Write-Host "Usuário $($u.Nome) criado."
}