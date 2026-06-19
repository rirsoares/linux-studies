#!/bin/bash
# =============================================================================
# Lab 04 —  ex04-file-check.sh - Linux Studies
# Autor: Ricardo Ribeiro
# Data: 2026-06-17
# Descrição: Recebe um arquivo e checa se existe, se é regular, tamnho e permissoes 
# Uso: bash  ex04-file-check.sh
# =============================================================================

set -euo pipefail

clear
if [[ $# -eq 0 ]]; then
  echo "Uso: $0 <arquivo>"
  exit 1
fi

if [[ -e "$1" ]]; then
  echo "Arquivo $1 Existe";
  tipo="$(stat -c "Tipo: %F" "$1")"
  tam="$(stat -c "Tamanho: %s" "$1")"
  perm="$(stat -c "Permissão: %A" "$1")"
  if [[ -f "$1" ]]; then
     echo "$tipo"
     echo "$tam"
     echo "$perm"

    elif  [[ -d "$1" ]]; then
          echo "$tipo"
          echo "$tam"
          echo "$perm"
    else 
          echo "É outro tipo de Arquivo"
  fi
fi




