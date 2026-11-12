#!/usr/bin/env bash
# Crea un run de hackathon desde las plantillas.
# Uso: ./scripts/new-run.sh nombre-del-equipo
#      ./scripts/new-run.sh nombre-del-equipo --baseline --adr --stage-contract
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

TEAM="${1:-}"
if [[ -z "$TEAM" || "$TEAM" == -* ]]; then
  echo "Uso: $0 nombre-del-equipo [--baseline] [--adr] [--stage-contract]" >&2
  exit 1
fi
shift || true

WITH_BASELINE=0
WITH_ADR=0
WITH_STAGE=0
for arg in "$@"; do
  case "$arg" in
    --baseline) WITH_BASELINE=1 ;;
    --adr) WITH_ADR=1 ;;
    --stage-contract) WITH_STAGE=1 ;;
    *) echo "Flag desconocida: $arg" >&2; exit 1 ;;
  esac
done

SLUG="$(echo "$TEAM" | tr '[:upper:]' '[:lower:]' | tr -s ' ' '-' | tr -cd 'a-z0-9-')"
if [[ -z "$SLUG" ]]; then
  echo "Slug de equipo invalido." >&2
  exit 1
fi

RUN=".ai/runs/$(date +%Y-%m-%d)-$SLUG"
if [[ -e "$RUN" ]]; then
  echo "Ya existe: $RUN" >&2
  exit 1
fi

mkdir -p "$RUN"
cp .ai/CONTEXT.md "$RUN/CONTEXT.md"
cp templates/01-idea.md templates/02-architecture.md templates/03-build-slice.md \
   templates/04-verification.md templates/05-pitch.md templates/design-brief.md "$RUN/"

if [[ "$WITH_BASELINE" -eq 1 ]]; then
  cp .ai/references/baseline.md "$RUN/baseline.md"
fi
if [[ "$WITH_STAGE" -eq 1 ]]; then
  cp templates/stage-contract.md "$RUN/stage-contract.md"
fi
if [[ "$WITH_ADR" -eq 1 ]]; then
  mkdir -p .ai/adr
  cp templates/adr.md .ai/adr/0001-borrador.md
fi

echo "Run creado: $RUN"
echo "1) Edita $RUN/CONTEXT.md (reloj, freeze, repo de codigo)."
echo "2) En .ai/CONTEXT.md pon Run actual: $RUN"
echo "3) Sigue PLAYBOOK.md (waves en 03-build-slice.md)."
