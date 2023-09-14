#!/bin/bashj

## Vars
model=Slowblood/opt-125m-gptq-4bit
num_shard=2
volume=$PWD/../../inference-data # share a volume with the Docker container to avoid downloading weights every run
name="text-generation-inference"
HF_HUB_TOKEN=hf_some_token

## Command
docker run --rm --name $name --gpus all --shm-size 1g -p 8081:80 \
    -v $volume:/data \
    ghcr.io/huggingface/text-generation-inference:latest \
    --model-id $model --num-shard $num_shard \
    --env HUGGING_FACE_HUB_TOKEN=$HF_HUB_TOKEN \
    --disable-custom-kernels

