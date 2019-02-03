[![Build Status](https://dev.azure.com/AwesomeContainer/AzurePipeline/_apis/build/status/AzurePipeline-wdocker-caddy)](https://dev.azure.com/AwesomeContainer/AzurePipeline/_build/latest?definitionId=2)

# wdocker-caddy
Windows Docker container: Caddy

Provided as-is. I do not own the software used in this container nor do I support it. If there is an issue with the container, please open up an issue on GitHub.

## Introduction
This is a Windows container, built using Docker.  In order to use this container, you have to be running Windows 10 1809 or Window Server 1809 and a recent copy of Docker up and running. 

## Running this container
To run this container, try using docker-compose. Adjust [docker-compose.yml](https://github.com/AwesomeContainer/wdocker-caddy/blob/master/docker-compose.yml) and save it in a local directory. Run the container:

  `docker-compose up -d`

You can update this container using docker-compose:

  `docker-compose pull`
  
  `docker-compose up -d`

If you don't want to use docker-compose, you can run this container directly from Docker Hub using Docker.exe:

  `docker run -d -p 80:80 --name Caddy -v C:\DockerData\caddy:c:\caddydata awesomecontainer/wdocker-caddy`
