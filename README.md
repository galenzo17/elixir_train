# Elixir Train

A repository for Elixir training and practice exercises.

## Setup

### Database

For local development, you can use the default PostgreSQL credentials or set your own:

```bash
# Copy the example environment file
cp .env.example .env

# Edit .env with your local database credentials (optional)
# Default values work with docker-compose
```

Start the database with Docker:
```bash
docker-compose up -d
```

Or set environment variables:
```bash
export DB_USERNAME=your_user
export DB_PASSWORD=your_password
export DB_HOSTNAME=localhost
export DB_NAME=elixir_train_dev
```