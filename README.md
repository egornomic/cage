# cage

Opinionated devcontainer launcher to run agents in yolo mode with persistent config across containers. Installs a ready-to-go template into a repo, brings the container up, and drops you into tmux. Based on the [banteg/devc](https://github.com/banteg/agents/tree/master/devcontainer).

## Requirements (macOS)

- Container runtime: Docker Desktop or OrbStack (recommended).
- `devcontainer` CLI: `npm install -g @devcontainers/cli`.

## Install (macOS)

Homebrew:

```bash
brew tap egornomic/cage
brew install cage
```

Fallback (from source):

```bash
./install.sh
```

This installs `cage` to `~/.local/bin` and the template to `~/.local/share/cage/template`.

## Usage

- `cage <repo>` or `cage .`: install template, start devcontainer, open tmux.
- `cage install <repo>`: install template only.
- `cage rebuild <repo>`: replace template, rebuild container without build cache, open tmux.
- `cage exec <repo> -- <cmd>`: run a command inside the devcontainer.
- `cage down <repo>`: stop and remove the devcontainer.
- `cage stop <repo>`: stop the devcontainer without removing it.
- `cage mount <repo> <host_path> <container_path> [--readonly]`: add a bind mount and recreate the container.
- `cage upgrade <repo>`: update claude/codex/pi inside the devcontainer.

Notes:
- After first install, log in once (or paste auth tokens from host). Auth persists across containers via mounted config volumes.
- Installs/overwrites `.devcontainer` in the target repo.
- Containers are named after the repo and, with OrbStack, are reachable from the host at `<name>.orb.local`.
- `CAGE_TEMPLATE_DIR` overrides the template source.
- `CAGE_SCREENSHOTS_DIR` overrides the screenshots mount (defaults to `~/Desktop`).
- Screenshots are mounted because you can't paste images into a devcontainer; dropping files into the host screenshots folder is the simplest bridge.
- macOS default screenshot shortcuts: ⌘⇧3 saves the full screen to a file, ⌘⇧4 saves a selection.
