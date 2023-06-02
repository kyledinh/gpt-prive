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

## make directories
if [ ! -e "../db" ]; then
  mkdir ../db
  echo "Making an db/"
fi

if [ ! -e "../models" ]; then
  mkdir ../models
  echo "Making an models/"
fi