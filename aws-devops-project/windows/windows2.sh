<powershell>
Install-WindowsFeature -name Web-Server -IncludeManagementTools

$info = systeminfo

$html = @"
<html>
<body>
<h2>System Information</h2>
<pre>
$info
</pre>
</body>
</html>
"@

$html | Out-File C:\inetpub\wwwroot\index.html
</powershell>