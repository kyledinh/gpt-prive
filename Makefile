export SHELL := /bin/bash

## VARS AND ENVS
REPO_DIR ?= $(shell pwd | xargs echo -n)

## MAIN ####
.PHONY: check ingest run setup

check:
	@echo "Python3: $(shell python3 --version)"
	@echo "PIP: $(shell pip3 --version)"
	@echo "REPO_DIR: $(REPO_DIR)"
	@cd scripts && ./check-cpu.sh

ingest:
	@python3 ingest.py

run:
	@python3 privateGPT.py

setup:
	@echo "SETUP:"
	@cd scripts && ./setup-init.sh
