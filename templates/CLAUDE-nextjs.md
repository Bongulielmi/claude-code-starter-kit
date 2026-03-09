# Project Context

## Stack
- Next.js 16 (App Router), React 19, TypeScript 6.x
- Tailwind CSS 4, shadcn/ui components
- Prisma ORM + PostgreSQL
- Auth.js (Better Auth) for authentication

## Architecture
- `app/` — App Router pages and layouts (file-based routing)
- `components/` — Reusable UI components (shadcn/ui conventions)
- `lib/` — Shared utilities, database client, auth config
- `actions/` — Server actions for mutations
- `api/` — API routes (only for webhooks and external integrations)

## Conventions
- Use Server Components by default; add `"use client"` only when needed
- Prefer Server Actions over API routes for data mutations
- Use `next/image` for all images, `next/link` for navigation
- Collocate components with their pages when page-specific
- Name files: `kebab-case.tsx` for components, `camelCase.ts` for utilities
- Use Zod for all input validation (forms, API inputs, env vars)
- Error boundaries at layout level, `error.tsx` per route segment

## Commands
- `npm run dev` — Start dev server (port 3000)
- `npm run build && npm start` — Production build
- `npx prisma migrate dev` — Run database migrations
- `npx prisma studio` — Database GUI
- `npm run lint` — ESLint + Prettier check
- `npm test` — Vitest unit tests

## Database
- Always create migrations for schema changes (`prisma migrate dev --name <description>`)
- Never edit migration files after they've been applied
- Use `@default(cuid(2))` for IDs, `@updatedAt` for timestamps

## Testing
- Unit tests with Vitest in `__tests__/` directories
- Use `@testing-library/react` for component tests
- Mock external services, never hit real APIs in tests

## Security
- Validate all inputs with Zod on the server side
- Use `auth()` from Auth.js to protect server actions and API routes
- Never expose database IDs in URLs without authorization checks
- Environment variables: `.env.local` for secrets, never commit
