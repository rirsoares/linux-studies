#!/bin/bash
# =============================================================================
# Ex05
# Autor: Ricardo Ribeiro
# Data: 2026-06-19
# Descrição: Caculadora para dois paramentros
# Uso: bash ex06-calc.sh
# =============================================================================

set -euo pipefail
clear

if [[ $# -lt 2 ]]; then
  echo "========================================"
  echo "Uso de $0 exige dois numeros"
  echo "========================================"
  exit 2
fi
soma=$(("$1" + "$2"))
subt=$(("$1" - "$2"))
mult=$(("$1" * "$2"))
div=$(("$1" / "$2"))
rest=$(("$1" % "$2"))

cat << EOF
Soma = $soma
Subtração = $subt
Multiplicação = $mult
Divisão = $div
Resto da Divisão = $rest
EOF


