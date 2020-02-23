# Docker: Python
Dockerfile for Python with mSMTP, includes Traefik support.

docker-compose file includes:
 - Python3
 - Traefik support

## Setup
1. clone the repo
2. edit `.env` file
3. create `msmtp/msmtprc` from provided `msmtprc.example`

after running docker-compose up you need to connect your reverse proxy to your new frontend network:
 you can do that manually using:
 ```
 docker network connect docker-python_frontend PROXY_CONTAINER_NAME
 ```

if you are using my Traefik setup there is a `connect.sh` script included that will connect all your frontend networks to your Traefik container.

Author: [RaveMaker][RaveMaker].

[RaveMaker]: http://ravemaker.net

