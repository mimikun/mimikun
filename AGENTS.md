# Repository Guidelines

## Project Structure & Modules
- Root docs: `README.md`, `RESUME.md`, `SKILL.md`, `vulnerability_project_resume.md`.
- Automation/config: `Makefile`, `maskfile.md`, `.mise.toml`, `.mise/tasks/**`.
- QA/CI: `.github/workflows/*.yml`, `.textlintrc.json`, `.typos.toml`, `package.json`.
- No runtime app code; this is a documentation-first repository.

## Build, Test, Development
- Install tools (locally): `pnpm install` (textlint only).
- Lint all: `make lint` (or `make test`).
- Format shell: `make format`.
- Morning workflow: `make morning-routine`.
- Create diff patch: `make patch` (copies to Windows `Downloads`).
- Direct task run: `mise tasks run <task>` (see `.mise/tasks/**`).

## Coding Style & Naming
- Markdown: follow Japanese technical writing via textlint. Config: `.textlintrc.json` (e.g., sentence length ≤ 150).
- Spelling: fix `typos` findings.
- Shell: keep POSIX/Bash compatible; format with `shfmt`; validate with `shellcheck`.
- Branches: `patch-YYYYMMDD` for daily work; default branch is `master`.
- Patch files: `mimikun.YYYYMMDD.patch` (auto-generated).

## Testing Guidelines
- This repo treats linting as tests. Run `make test` before pushing.
- CI runs: `textlint` (Markdown) and `typos` (spelling). Keep pipelines green.

## Commit & Pull Requests
- Commit messages: concise imperative subject; include context (e.g., `docs: refine resume intro`).
- PRs should include:
  - Summary of changes and motivation
  - Affected files/sections
  - Confirmation that `make test` passes
  - Screenshots for README visual changes (optional)

## Security & Configuration
- Do not commit secrets or tokens. Workflows pin Actions to SHAs; keep them pinned.
- Optional: encrypt patches with GPG when sharing externally (see `maskfile.md`).

## Agent-Specific Instructions
- Prefer `Makefile` targets; they delegate to `mise` tasks.
- Keep patches minimal and scoped; do not rename files without need.
- Do not introduce new tooling unless requested; follow existing QA stack.

