#!/usr/bin/env bash
set -euo pipefail

SRC="/home/huang/Blog/butterflyblog/public"
DST="/home/huang/wardell-H.github.io/butterflyblog"

# Optional: pass --yes to skip confirmation
AUTO_YES="${1:-}"

if [[ ! -d "$SRC" ]]; then
  echo "[Error] Source folder does not exist: $SRC"
  exit 1
fi

if [[ "$AUTO_YES" != "--yes" ]]; then
  echo "This will fully sync source to destination (including deleting extra files in destination):"
  echo "  Source:      $SRC"
  echo "  Destination: $DST"
  read -r -p "Continue? [y/N] " ans
  case "$ans" in
    y|Y|yes|YES) ;;
    *)
      echo "Canceled."
      exit 0
      ;;
  esac
fi

mkdir -p "$DST"

# Mirror source -> destination
rsync -av --delete --exclude ".git/" "$SRC/" "$DST/"

echo "Done: $SRC -> $DST"
