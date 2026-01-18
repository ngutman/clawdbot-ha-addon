# Clawdbot Home Assistant Add-ons

This repository contains Home Assistant add-ons for Clawdbot.

## Add-ons

### clawdbot_gateway
Clawdbot Gateway for HA OS with SSH tunnel support for Mac node connections.

**Included tools:**
- **gog** — Google Workspace CLI (Gmail, Calendar, Drive, Contacts, Sheets, Docs). See [gogcli.sh](https://gogcli.sh)
- **gh** — GitHub CLI.

## Installation

1. Go to **Settings → Add-ons → Add-on Store → ⋮ → Repositories**
2. Add this repository:
   ```
   https://github.com/ngutman/clawdbot-ha-addon
   ```
3. Find "Clawdbot Gateway" in the add-on store and install

## Configuration

| Option | Description |
|--------|-------------|
| `port` | Gateway WebSocket port (default: 18789) |
| `verbose` | Enable verbose logging |
| `repo_url` | Clawdbot source repository |
| `branch` | Branch to checkout (optional, uses repo's default if omitted) |
| `github_token` | GitHub token for private repos |
| `ssh_port` | SSH server port for tunnel access (default: 2222) |
| `ssh_authorized_keys` | Public keys for SSH access |

## Links
- [Clawdbot](https://github.com/clawdbot/clawdbot)
- [gog CLI](https://gogcli.sh)
- [GitHub CLI](https://cli.github.com)
