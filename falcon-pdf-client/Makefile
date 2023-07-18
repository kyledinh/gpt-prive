export SHELL := /bin/bash

## MAIN #####
.PHONY: init info setup

delete:
	conda env remove --name falcon-pdf-client

setup:
	conda create -n falcon-pdf-client python=3.10
	conda activate falcon-pdf-client && pip install -r requirements.txt
	@cp .env.sample .env
	@echo "UPDATE YOUR .env file with URL and TOKEN!!!!"

start:
	conda activate falcon-pdf-client

info:
	conda info
	conda env list

run:
	python falcon-file-client.py --fname ign-zio.pdf