#!/usr/bin/env bash
# Crea una nota nueva en el juanvault y la abre en nvim.
# Pensado para correr dentro de un display-popup de tmux (prefix + n).
set -euo pipefail

VAULT="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/juanvault"

read -rp "Título de la nota: " title
[ -z "${title// /}" ] && exit 0   # cancelar si quedó vacío

file="$VAULT/$title.md"

# Sembrar la nota con un H1 sólo si todavía no existe (no pisar una nota ya creada).
if [ ! -e "$file" ]; then
  printf '# %s\n\n' "$title" > "$file"
fi

cd "$VAULT"
exec nvim "$file"
