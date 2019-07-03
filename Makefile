NOTEBOOK_DIR = notebook

.PHONY: init
init: ## Install all packages
	pipenv install

.PHONY: run
run: ## Run jupyter lab
	@mkdir -p $(NOTEBOOK_DIR)
	@pipenv run -- jupyter lab --notebook-dir=$(NOTEBOOK_DIR)

.PHONY: destroy
destroy: ## Remove the virtualenv
	pipenv --rm

.PHONY: help
help: ## Show help messages
	@echo 'Options:'
	@echo '    NOTEBOOK_DIR   The directory to use for notebooks and kernels. [default: notebook]'
	@echo ''
	@echo 'Commands:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "    \033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: all
all: help
	@false

.DEFAULT_GOAL := all
