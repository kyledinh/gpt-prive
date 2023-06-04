#!/bin/bash

## .env file
if [ ! -e "../.env" ]; then
  cp ../example.env ../.env
  echo "Making an .env file from example.env."
fi

## get required packages
os=$(uname -s)
cpu="UNKNOWN"

if [[ "$os" == "Darwin" ]]; then
  echo "Operating System: macOS"
  cpu=$(sysctl -n machdep.cpu.brand_string)
  if [[ "$cpu" == "Intel" ]]; then
    echo "Intel for MacOS pip install requirements"
    ARCHFLAGS="-arch x86_64" pip3 install -r ../requirements.txt
  else
    pip3 install -r ../requirements.txt
  fi
else
  echo "Default pip install requirements"
  pip3 install -r ../requirements.txt
fi

## https://github.com/imartinez/privateGPT/issues/59
## https://github.com/hippalectryon-0/CASALIOY/blob/3af2ae5edc1f6c0adfc2fb0cfb3e4ac852b82dbd/Dockerfile
python3 -m pip uninstall -y llama-cpp-python
CMAKE_ARGS="-DLLAMA_CUBLAS=on" FORCE_CMAKE=1 python3 -m pip install llama-cpp-python  # GPU support
# pre-commit install


# https://github.com/imartinez/privateGPT/discussions/217


## make directories
if [ ! -e "../db" ]; then
  mkdir ../db
  echo "Making an db/"
fi

if [ ! -e "../models" ]; then
  mkdir ../models
  echo "Making an models/"
fi