export SHELL := /bin/bash

## VARS AND ENVS
REPO_DIR ?= $(shell pwd | xargs echo -n)

## MAIN ####
.PHONY: check ingest run run-gpt4all run-llama setup

check:
	@echo "Python3: $(shell python3 --version)"
	@echo "PIP: $(shell pip3 --version)"
	@echo "REPO_DIR: $(REPO_DIR)"
	@cd scripts && ./check-cpu.sh
	@echo $(ARG)

ingest:
	@python3 ingest.py

run:
	@python3 privateGPT.py

run-gpt4all:
	@cp .env.GPT4All .env
	@make run

# Currently not working to use the GPU
run-llama:
	@cp .env.LlamaCpp .env
	@make run

setup:
	@echo "SETUP:"
	@cd scripts && ./setup-init.sh
