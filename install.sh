#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -x "$SCRIPT_DIR/cage" ]]; then
  echo "error: expected cage executable at $SCRIPT_DIR/cage" >&2
  exit 1
fi

"$SCRIPT_DIR/cage" self-install
