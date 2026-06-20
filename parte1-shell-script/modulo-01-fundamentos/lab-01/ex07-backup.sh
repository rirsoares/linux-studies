#!/bin/bash
# =============================================================================
# Ex07
# Autor: Ricardo Ribeiro
# Data: 2026-06-19
# Descrição: Receba um arquivo como arg. e crie uma cópia com a data no nome
# Uso: bash ex07-backup.sh
# =============================================================================

set -euo pipefail
clear

if [[ $# -lt 1 ]]; then
  echo "========================================================"
  echo "Uso de $0 Exige um Nome de Arquivo para Backup"
  echo "========================================================"
  exit 1
fi

arq="$1"
dat=$(date '+%Y-%m-%d %H:%M:S')
backup="${arq}.bkp.${dat}"

if [[ ! -f "$arq" ]]; then
  echo "========================================================"
  echo "Arquivo não existe"
  echo "========================================================"
  exit 1
fi


if [[ -f "$backup" ]]; then
  echo "========================================================"
  echo "Arquivo backup já Existe, não vou sobreescreve-lo"
  echo "========================================================"
  exit 1
fi


cp "$arq" "$backup"
echo "Backup criado: $backup"


