# Awesome Container (Windows): Caddy
# https://hub.docker.com/r/awesomecontainer/wdocker-caddy
# https://github.com/AwesomeContainer/wdocker-caddy

FROM microsoft/windowsservercore

LABEL Description="Caddy" Vendor="Light Code Labs" Version="latest"

EXPOSE 80

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; \
    Invoke-WebRequest -Method Get -Uri 'https://caddyserver.com/download/windows/amd64?license=personal' -OutFile c:\caddy.zip; \
    Expand-Archive -Path c:\caddy.zip -DestinationPath c:\caddy\; \
    Start-Sleep -Seconds 3; \
    $conf = 'import c:\caddydata\conf\*\'; \
    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False); \
    [System.IO.File]::WriteAllLines('c:\caddy\Caddyfile', $conf, $Utf8NoBomEncoding); \
    New-Item c:\caddydata -type directory ; \
    Remove-Item c:\caddy.zip -Force \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices' -Name 'G:' -Value "\??\C:\caddydata" -Type String;

WORKDIR /caddy

VOLUME c:\\caddydata

CMD ["/caddy/caddy.exe"]