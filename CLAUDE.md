# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a GitHub profile repository containing Japanese resume/CV documents (職務経歴書) and skill sheets. The repository focuses on documentation quality and cross-platform development workflows.

## Common Development Commands

### Essential Commands
- `make test` - Run all linting (equivalent to `make lint`)
- `make lint` - Run comprehensive linting suite (textlint, typos, shell linting, GitHub Actions validation)
- `make format` - Format shell scripts using shfmt
- `make morning-routine` - Daily workflow: fetch, cleanup branches, pull, create patch branch

### Individual Linting Tools
- `pnpm run textlint` - Japanese technical writing validation using textlint-rule-preset-ja-technical-writing
- `typos .` - Spell checking with typos
- `shellcheck` + `shfmt` - Shell script quality validation (Linux only)
- `ghalint run` - GitHub Actions configuration validation
- `actionlint` - GitHub Actions workflow validation
- `zizmor .` - GitHub Actions security analysis

## Development Workflow

### Branch Management
The repository uses a patch-based workflow:

1. **Morning Setup**: `make morning-routine`
   - Fetches all remotes with cleanup
   - Deletes old patch branches
   - Pulls latest changes
   - Creates new dated patch branch (`patch-YYYYMMDD`)

2. **Patch Creation**: `make patch`
   - Creates git diff patch against master
   - Copies patch to Windows Downloads folder
   - Supports GPG encryption for security

### Task Management
Uses [mise](https://github.com/jdx/mise) tasks as the underlying execution engine. All Makefile targets delegate to `mise tasks run <task>`.

## Architecture & Quality Standards

### Document Quality Management
- **TextLint**: Enforces Japanese technical writing standards
- **Typos**: Prevents spelling errors across all files
- **GitHub Actions**: Automated quality checks on push to master

### Cross-Platform Support
- **Linux/WSL**: Primary development environment
- **Windows**: Secondary support via PowerShell scripts in maskfile.md
- **Platform-specific features**:
  - Linux: Full shell linting, GitHub Actions validation
  - Windows: Basic functionality with patch file copying

### Security Features
- **GPG Integration**: Optional patch encryption using predefined public key
- **GitHub Actions Security**: zizmor analysis for workflow vulnerabilities

## File Structure Context

### Core Documents (Japanese)
- `RESUME.md` - 職務経歴書 (Professional resume)
- `SKILL.md` - スキルシート (Technical skills matrix)
- `vulnerability_project_resume.md` - Detailed project case study

### Configuration Files
- `package.json` - textlint dependencies and scripts
- `maskfile.md` - Cross-platform task definitions
- `Makefile` - Primary command interface
- `.typos.toml` - Spell checking configuration
- `renovate.json5` - Dependency update automation

### Quality Assurance
The repository prioritizes documentation quality over code functionality, with comprehensive linting for:
- Japanese language technical writing standards
- Spelling accuracy
- Shell script quality
- GitHub Actions configuration security

## Development Notes

- All make targets support cross-platform execution through mise tasks
- Patch workflow designed for secure code review in corporate environments
- Heavy emphasis on automated quality validation before changes reach master branch
- Documentation-first approach with multiple layers of quality checks