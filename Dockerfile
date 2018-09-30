FROM microsoft/windowsservercore

MAINTAINER AwesomeContainer

LABEL Description="Caddy" Vendor="Light Code Labs" Version="latest"

EXPOSE 80

RUN powershell -Command \
    $ErrorActionPreference = 'Stop'; \

	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; \
    Invoke-WebRequest -Method Get -Uri 'https://caddyserver.com/download/windows/amd64?license=personal' -OutFile c:\caddy.zip ; \
	
    Expand-Archive -Path c:\caddy.zip -DestinationPath c:\caddy\ ; \
    Start-Sleep -Seconds 3; \
	
    $conf = \"import c:\caddydata\conf\*\"; \
    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False); \
    [System.IO.File]::WriteAllLines('c:\caddy\Caddyfile', $conf, $Utf8NoBomEncoding); \
	#Out-File -Encoding ASCII -FilePath 'c:\caddy\Caddyfile' -InputObject $conf; \
	#Out-File -FilePath C:\caddy\Caddyfile -InputObject $conf -Force ; \

    New-Item c:\caddydata -type directory ; \
    Remove-Item c:\caddy.zip -Force

WORKDIR /caddy

VOLUME c:\\caddydata

CMD ["/caddy/caddy.exe"]