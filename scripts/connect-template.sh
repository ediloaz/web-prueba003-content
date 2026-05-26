#!/usr/bin/env bash
# Ejecutar desde la raíz de un repo cliente (web-*-content), no desde boilerplate-content.
set -euo pipefail

REMOTE_NAME="boilerplate-content"
REMOTE_URL="https://github.com/ediloaz/boilerplate-content.git"

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "Error: no estás en un repositorio git." >&2
  exit 1
fi

if git remote get-url "$REMOTE_NAME" >/dev/null 2>&1; then
  echo "Remoto '$REMOTE_NAME' ya existe: $(git remote get-url "$REMOTE_NAME")"
else
  git remote add "$REMOTE_NAME" "$REMOTE_URL"
  echo "Remoto '$REMOTE_NAME' agregado → $REMOTE_URL"
fi

git fetch "$REMOTE_NAME"
echo "Listo. Probá: git log ${REMOTE_NAME}/main --oneline -5"
