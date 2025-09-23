.PHONY: help setup deps test coverage quality format server console clean

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## Initial project setup
	mix deps.get
	mix compile

deps: ## Install dependencies
	mix deps.get

test: ## Run tests
	mix test

coverage: ## Run tests with coverage
	mix test.coverage

quality: ## Run quality checks (format, credo, dialyzer)
	mix quality

format: ## Format code
	mix format

server: ## Start Phoenix server
	iex -S mix phx.server

console: ## Start IEx console
	iex -S mix

clean: ## Clean build artifacts
	mix clean
	rm -rf _build deps

db.create: ## Create database
	mix ecto.create

db.migrate: ## Run database migrations
	mix ecto.migrate

db.reset: ## Reset database
	mix ecto.drop
	mix ecto.create
	mix ecto.migrate

db.seed: ## Seed database
	mix run priv/repo/seeds.exs