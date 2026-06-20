#!/bin/bash
# =============================================================================
# Ex01 — Meu 2° script
# Autor: Ricardo Ribeiro
# Data: 2026-06-16
# Descrição: Fornecer o nome do usuario e receber saudacao
# Uso: bash ex02-saudacao.sh
# =============================================================================

set -euo pipefail

if [ $# -eq 0 ]; then
  echo "Uso $0 <nome>"
  exit 1
fi

echo "Saudaçoes $1, Seja Bem-vindo!"
