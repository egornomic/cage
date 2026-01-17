#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"
SHARE_DIR="$HOME/.local/share/cage/template"
TEMPLATE_DIR="$SCRIPT_DIR/template"

if [[ ! -x "$SCRIPT_DIR/cage" ]]; then
  echo "error: expected cage executable at $SCRIPT_DIR/cage" >&2
  exit 1
fi

if [[ ! -d "$TEMPLATE_DIR" ]]; then
  echo "error: expected template dir at $TEMPLATE_DIR" >&2
  exit 1
fi

mkdir -p "$BIN_DIR" "$SHARE_DIR"

cp -f "$SCRIPT_DIR/cage" "$BIN_DIR/cage"
chmod +x "$BIN_DIR/cage"

rm -rf "$SHARE_DIR"
mkdir -p "$SHARE_DIR"
cp -f "$TEMPLATE_DIR/"* "$SHARE_DIR/"

echo "✓ installed cage to $BIN_DIR/cage" >&2
echo "✓ installed template to $SHARE_DIR" >&2
echo "note: ensure $BIN_DIR is on your PATH" >&2
