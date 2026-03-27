
<powershell>

 

# Install IIS Web Server

Install-WindowsFeature -name Web-Server -IncludeManagementTools

 

# Start IIS Service

Start-Service W3SVC

Set-Service -Name W3SVC -StartupType Automatic

 

# Install Google Chrome

Invoke-WebRequest "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile "C:\ChromeSetup.exe"

Start-Process "C:\ChromeSetup.exe" -ArgumentList "/silent /install" -Wait

 

# Create HTML page

$htmlContent = @"

<!DOCTYPE html>

<html>

<head>

    <title>Windows EC2 Chrome Server</title>

</head>

<body style="text-align:center; font-family:Arial;">

    <h1>Windows EC2 Instance with Chrome</h1>

    <p>IIS is running successfully.</p>

    <p>Google Chrome has been installed.</p>

</body>

</html>

"@

 

# Save HTML file

$htmlContent | Out-File -Encoding UTF8 "C:\inetpub\wwwroot\index.html"

 

# Allow HTTP traffic

New-NetFirewallRule -DisplayName "Allow HTTP" -Direction Inbound -Protocol TCP -LocalPort 80 -Action Allow

 

# Restart IIS

iisreset

 

</powershell>


