<powershell>
Install-WindowsFeature -name Web-Server -IncludeManagementTools

$html = @"
<html>
<head>
<title>Windows Instance 1</title>
</head>
<body style='text-align:center;font-family:Arial'>
<h1>Welcome to Windows EC2 Server</h1>
<p>This webpage was automatically deployed using PowerShell.</p>
</body>
</html>
"@

$html | Out-File C:\inetpub\wwwroot\index.html
</powershell>