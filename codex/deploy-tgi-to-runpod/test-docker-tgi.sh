#!/bin/bash

docker exec -it text-generation-inference text-generation-launcher --help
docker exec -it text-generation-inference text-generation-launcher --env
docker exec -it text-generation-inference text-generation-launcher --version

curl 127.0.0.1:8081/generate \
    -X POST \
    -d '{"inputs":"What is Deep Learning?","parameters":{"max_new_tokens":100}}' \
    -H 'Content-Type: application/json'

# curl 127.0.0.1:8080/generate_stream \
#     -X POST \
#     -d '{"inputs":"What is Deep Learning?","parameters":{"max_new_tokens":17}}' \
#     -H 'Content-Type: application/json'