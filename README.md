# jefflesterdev-api

This is the backend for my personal portfolio site at jefflester.dev. It's a REST API running on Cloudflare Workers, backed by a D1 SQLite database, and it serves everything the front end needs: profile info, work history, skills, and achievements.

The API is built with [Hono](https://hono.dev) for routing and [Chanfana](https://chanfana.com) for OpenAPI schema generation. Chanfana wires up the OpenAPI docs automatically from the endpoint definitions, so there's no separate spec file to maintain. You can browse the live docs at the `/` route once the worker is deployed.

## Stack

- **Runtime:** Cloudflare Workers
- **Router:** Hono
- **OpenAPI:** Chanfana
- **Database:** Cloudflare D1 (SQLite)
- **Testing:** Vitest with `@cloudflare/vitest-pool-workers`
- **Package manager:** pnpm

## Getting started

Install dependencies:

```bash
pnpm install
```

Start the local dev server (this also applies any pending migrations to the local D1 database):

```bash
pnpm dev
```

Seed the local database with profile data:

```bash
pnpm seed
```

## Database

Migrations live in the `migrations/` directory and are applied automatically when you run `pnpm dev` locally. For the remote database, run:

```bash
pnpm run seedLocalDb  # local only
pnpm run seed:remote  # production D1
```

If you make schema changes, add a new numbered migration file in `migrations/` and Wrangler will pick it up.

## API endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/profile` | Name, tagline, bio, contact info |
| GET | `/experience` | Work history with bullet points |
| GET | `/skills` | Skill groups and proficiency levels |
| GET | `/achievements` | Key career achievements |

Full interactive docs are available at the root URL when the worker is running.

## Testing

```bash
pnpm test
```

Tests run against a real local Workers environment via Vitest, not mocks.

## Deployment

Migrations are applied automatically before each deploy via the `predeploy` script:

```bash
pnpm deploy
```

The worker is configured in `wrangler.jsonc`. The D1 binding name is `DB`.
