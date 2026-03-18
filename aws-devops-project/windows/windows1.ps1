<powershell>
 
# Install IIS Web Server
Install-WindowsFeature -name Web-Server -IncludeManagementTools
 
# Start IIS Service
Start-Service W3SVC
Set-Service -Name W3SVC -StartupType Automatic
 
# Create a simple HTML page
$htmlContent = @"
<!DOCTYPE html>
<html>
<head>
    <title>AWS Windows Server</title>
</head>
<body style="text-align:center; font-family:Arial;">
    <h1>🚀 Hello from Windows EC2!</h1>
    <p>This web server is running using IIS.</p>
    <p>Deployed using PowerShell script 🎯</p>
</body>
</html>
"@
 
# Save HTML file to IIS root folder
$path = "C:\inetpub\wwwroot\index.html"
$htmlContent | Out-File -Encoding UTF8 $path
 
# Allow HTTP traffic through firewall
New-NetFirewallRule -DisplayName "Allow HTTP" -Direction Inbound -Protocol TCP -LocalPort 80 -Action Allow
 
# Restart IIS
iisreset
 
</powershell>
