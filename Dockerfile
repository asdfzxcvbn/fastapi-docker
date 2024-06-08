FROM docker.io/python:3.12.4-alpine
ENV DEPLOY_TYPE=devel

WORKDIR /app
RUN [ "pip", "install", "--no-cache-dir", "-U", "fastapi", "uvicorn", "orjson", "aiohttp[speedups]" ]

EXPOSE 5678
CMD if [ "$DEPLOY_TYPE" == "devel" ]; then \
        uvicorn main:app --reload --host 0.0.0.0 --port 5678 --proxy-headers; \
    else \
        uvicorn main:app --host 0.0.0.0 --port 5678 --log-level critical --proxy-headers; \
    fi
