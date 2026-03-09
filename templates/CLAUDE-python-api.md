# Project Context

## Stack
- Python 3.12+, FastAPI, Pydantic v2
- SQLAlchemy 2.0 (async) + Alembic migrations
- PostgreSQL (primary), Redis (caching/queues)
- uv for dependency management

## Architecture
- `src/app/` — FastAPI application factory and config
- `src/api/` — Route handlers organized by domain (`/users`, `/items`)
- `src/models/` — SQLAlchemy ORM models
- `src/schemas/` — Pydantic request/response schemas
- `src/services/` — Business logic layer
- `src/core/` — Auth, config, database, exceptions
- `tests/` — Mirrors src/ structure

## Conventions
- Use `python3` (not `python`) and `pip3` (not `pip`)
- Type hints everywhere — Pydantic models for all I/O
- Async by default — use `async def` for all route handlers
- Dependency injection via FastAPI's `Depends()`
- Separate schemas for Create, Update, and Response
- Use `HTTPException` with specific status codes
- Structured logging with `structlog`

## Commands
- `uv run fastapi dev` — Development server with hot reload
- `uv run alembic upgrade head` — Run migrations
- `uv run alembic revision --autogenerate -m "description"` — Create migration
- `uv run pytest` — Run all tests
- `uv run pytest -x --tb=short` — Run tests, stop on first failure
- `uv run ruff check . && uv run ruff format .` — Lint and format

## Database
- Always use Alembic for schema changes, never raw DDL
- Use `UUID` primary keys with `server_default=text("gen_random_uuid()")`
- Add `created_at` and `updated_at` to all models
- Use `select()` with explicit columns when possible for performance

## Testing
- Use `pytest` with `pytest-asyncio` for async tests
- `httpx.AsyncClient` for API integration tests
- Factory functions for test data (avoid fixtures for data)
- Test database: separate PostgreSQL database, migrations applied in conftest

## Security
- Validate all inputs via Pydantic (automatic with FastAPI)
- Use OAuth2 with JWT tokens for authentication
- Rate limiting via `slowapi` middleware
- CORS configured for specific origins only
- Secrets via environment variables, never in code
