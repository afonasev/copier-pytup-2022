.DEFAULT_GOAL := help

#
# VARIABLES
#

PYTHON = python3
VENV = .venv
PIP = $(VENV)/bin/pip
BIN = $(VENV)/bin

# add your code folders here
CODE = simple tests

#
# COMMON ACTIONS
#

.PHONY: help
help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'

.PHONY: init
init: ## Create python venv and install deps
	git init
	$(PYTHON) -m venv $(VENV)
	$(PIP) install --upgrade pip pytest

.PHONY: shell
shell: ## run python shell
	$(BIN)/python

#
# CI ACTIONS
#

.PHONY: test
test: ## run tests
	@echo "\n********* RUN TESTS *********\n"
	$(BIN)/pytest tests $(args)
