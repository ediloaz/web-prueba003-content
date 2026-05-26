#!/usr/bin/env bash
# Uso: ./cherry-pick.sh <commit-sha>
# Ejecutar desde la raíz de un repo cliente (web-*-content).
set -euo pipefail

REMOTE_NAME="boilerplate-content"
SHA="${1:-}"

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "Error: no estás en un repositorio git." >&2
  exit 1
fi

if [[ -z "$SHA" ]]; then
  echo "Uso: $0 <commit-sha>" >&2
  echo "Ejemplo: $0 26847fb269da4a1ba033c949b706eee31245ec6e" >&2
  exit 1
fi

if ! git remote get-url "$REMOTE_NAME" >/dev/null 2>&1; then
  echo "Error: falta el remoto '$REMOTE_NAME'. Corré primero: ./connect-template.sh" >&2
  exit 1
fi

git fetch "$REMOTE_NAME"

if ! git cat-file -e "${SHA}^{commit}" 2>/dev/null; then
  echo "Error: el commit '$SHA' no existe tras fetch (¿hash correcto? ¿está en ${REMOTE_NAME}/main?)." >&2
  exit 1
fi

git cherry-pick "$SHA"
echo "Cherry-pick OK: $SHA"
