# fastapi-docker
a docker image to quickly deploy a fastapi program

the image contains fastapi, uvicorn, orjson, and aiohttp.

# usage
example usage can be found in this repo's `docker-compose.yml`

`DEPLOY_TYPE` should be "devel" for development (passed to uvicorn, watches filesystem for changes), otherwise you can keep the default as "prod"

your `./app` directory should at least contain `main.py`

you can change the exposed port as you wish, just keep it binded to localhost and point your reverse proxy to it (i don't think exposing uvicorn to the internet is a good idea)
