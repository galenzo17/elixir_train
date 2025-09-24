# Elixir Train Interview Project Context

## Project Overview
This is an Elixir/Phoenix application designed for technical interviews and assessments.
The project follows a minimal Phoenix/Ecto structure optimized for interview scenarios.

## Key Information
- **Framework**: Phoenix Framework with Ecto
- **Language**: Elixir
- **Database**: SQLite3 in-memory (using Ecto.Adapters.SQLite3)
- **Main Branch**: master

## Project Structure
- `/lib` - Core application code
- `/test` - Test files
- `/docs` - Documentation
- `/config` - Configuration files
- `/deps` - Dependencies (managed by Mix)

## Important Context Files
This project uses multiple CONTEXT.md files to provide specific context for different areas:
- `CONTEXT.md` - Main project context (this file)
- `lib/CONTEXT.md` - Code structure and implementation details
- `docs/CONTEXT.md` - Documentation guidelines and standards
- `test/CONTEXT.md` - Testing approach and conventions

## Development Guidelines
1. Follow Elixir conventions and best practices
2. Use pattern matching effectively
3. Maintain functional programming principles
4. Keep modules focused and cohesive
5. Write comprehensive tests for all functionality

## Environment Configuration
The project uses environment-based configuration:
- SQLite3 in-memory database (`:memory:`) for dev and test environments
- Configuration split between dev, test, and prod environments
- Lightweight setup ideal for interview scenarios with no external database dependencies

## API Structure
- RESTful API endpoints under `/api` scope
- JSON responses for all API endpoints
- Proper HTTP status codes and error handling

## Important Notes
- This codebase is specifically structured for interview scenarios
- Focus on clean, readable, and maintainable code
- Demonstrate best practices in Elixir/Phoenix development

## AI Assistant Rules
- Always reason step by step through problems
- Always create a plan before implementing solutions
- Never add comments to code unless explicitly requested
- Always create a CONTEXT.md file when adding new directories and features
- Always build test structure first, with suggested tests without implementation
- Always update CONTEXT files if something changed