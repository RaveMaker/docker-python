# Docker: Python
Dockerfile for Python3, includes Traefik support.

docker-compose file includes:
 - Python3
 - Traefik support

## Setup:
1. clone the repo
2. create `.env` file from `.env.example`
3. place your python app in 'app' folder
4. app should have a 'requirements.txt' file at 'app/requirements.txt'

## WSGI Server
In prod we will use a server instead of running the app with python. 
For example I will use 'Gunicorn' server but you can use whatever you want.

1. make sure you have 'gunicorn==...' in your 'requirements.txt' file
2. override 'CMD/ENTRYPOINT' using `docker-compose.override.yml`:

```
version: "3.7"

services:
  python:
    command: ["gunicorn", "b", "0.0.0.0:80"]
    entrypoint: ["/app/main.py"]
```

## Network settings:
Container is connected to to a unique network named stack-name_frontend such as:

- docker-python_frontend

after running docker-compose up you need to connect your reverse proxy to your new frontend network:
 you can do that manually using:

 ```
 docker network connect docker-python_frontend PROXY_CONTAINER_NAME
 ```

if you are using my Traefik setup there is a `connect.sh` script included that will connect all your frontend networks to your Traefik container.

Author: [RaveMaker][RaveMaker].

[RaveMaker]: http://ravemaker.net

