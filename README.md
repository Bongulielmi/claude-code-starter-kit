# Claude Code Starter Kit

Production-ready configurations for Claude Code. Templates, commands, and MCP server configs built from daily usage across 30+ repositories with a multi-agent setup.

## What's Included (Free)

These are full, production-grade configurations — not stripped-down demos.

### Templates

**Next.js 16** (`templates/CLAUDE-nextjs.md`)
Complete project instructions for App Router, Server Components, Prisma, and Auth.js. Covers architecture, conventions, database workflow, testing with Vitest, and security guidelines.

**Python + FastAPI** (`templates/CLAUDE-python-api.md`)
Async-first API configuration with SQLAlchemy 2.0, Alembic migrations, Pydantic v2 validation, structured logging, and pytest integration.

### Commands

**`/review`** — Deep code review that catches what linters miss. Scans your git diff for bugs, security vulnerabilities, performance issues, correctness edge cases, and style inconsistencies. Outputs actionable findings with severity levels and fix suggestions.

**`/test-gen`** — Generates comprehensive tests for your changed files. Detects your test framework automatically, analyzes functions for edge cases, and produces ready-to-run test files with happy path, boundary, and error coverage.

### MCP Config

**Filesystem** (`mcp-configs/filesystem.json`) — Ready-to-paste MCP server configuration with inline setup instructions.

### Setup
```bash
bash scripts/setup.sh
```
Installs templates and commands into `~/.claude/`. Non-destructive — skips files that already exist.

---

## Full Kit

Everything above, plus:

| | Free | Full Kit |
|---|---|---|
| CLAUDE.md templates | 2 | 13 (+ Go, Rust, Django, React SPA, TypeScript CLI, multi-agent team) |
| Slash commands | 2 | 10 (+ /secure, /deploy-check, /perf, /refactor, /explain, /pr-draft, /migrate-db, /fork) |
| MCP configs | 1 | 8 (+ GitHub, PostgreSQL, Brave Search, Puppeteer, Slack, OpenClaw, full-stack combo) |
| Multi-agent orchestration | -- | Complete system with Orchestrator, Backend, Frontend, Quality, Data, and Planning agent configs |
| Agent setup script | -- | One command to create git worktrees and launch a coordinated agent team via tmux |

The multi-agent orchestration is the part you won't find anywhere else. Each agent gets role-specific instructions with ownership boundaries, coordination protocols, and quality gates — extracted from a system running 9 agents in production.

**[Get the Full Kit — $29](https://remigio18.gumroad.com/l/upzkri)**

---

## About

Built by [Remigio Bongulielmi](https://www.remigiobongulielmi.com), CTO with 15+ years in operations, AI, and venture growth.

## License

MIT
