# Development Guide

## Testing GitHub Workflows Locally

Use [act](https://github.com/nektos/act) to run GitHub Actions workflows locally before pushing.

### Prerequisites

- Docker installed and running
- act CLI installed

### Install act

**macOS (Homebrew):**
```bash
brew install act
```

**Linux:**
```bash
curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
```

**Windows (Chocolatey):**
```bash
choco install act-cli
```

### Running Workflows

```bash
# List available workflows
act -l

# Dry run (show what would execute)
act -n push

# Run push event workflows
act push

# Run specific job
act -j lint

# Run with verbose output
act -v push

# Run workflow_dispatch (manual trigger)
act workflow_dispatch
```

### Common Issues

| Issue | Solution |
|-------|----------|
| Docker not running | Start Docker Desktop |
| Permission denied | Run `chmod +x init-coding-agents.sh` |
| macOS runner not available | Use `-P ubuntu-latest=catthehacker/ubuntu:act-latest` |

### Testing init-coding-agents.sh

```bash
# Test the init script directly
./init-coding-agents.sh

# Test with install mode (requires sudo on Linux)
./init-coding-agents.sh --install
```

## Project Scripts

| Script | Purpose |
|--------|---------|
| `init-coding-agents.sh` | Check/install dependencies for Claude Code skills |
| `init-coding-agents.sh --install` | Auto-install missing dependencies |
