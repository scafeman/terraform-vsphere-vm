# Generate a password and save it to a file
Add-Type -AssemblyName System.Web
$generatedPassword = [System.Web.Security.Membership]::GeneratePassword(12, 0) -replace '[\W_]', (Get-Random -Maximum 9)
$generatedPassword | Set-Content -Path 'C:\rs-pkgs\Automation\pw.txt' -Force

# Retrieve the password and update the Administrator account
$password = Get-Content -Path 'C:\rs-pkgs\Automation\pw.txt'
net user Administrator $password
net user Administrator /logonpasswordchg:yes

# Set the password in VMware guestinfo
& 'C:\Program Files\VMware\VMware Tools\vmtoolsd.exe' --cmd "info-set guestinfo.admin.password $password"

# Remove the password file
Remove-Item -Path 'C:\rs-pkgs\Automation\pw.txt' -Force

# Wait for a few seconds and then log off the session
Start-Sleep -Seconds 5
logoff
