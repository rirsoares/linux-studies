#!/bin/bash
# =============================================================================
# Ex08 
# Autor: Ricardo Ribeiro
# Data: 2026-06-20
# Descrição: Relatório de usuarios
# Uso: bash ex08-users.sh
# =============================================================================


set -euo pipefail
clear

if  [ $# -lt 1 ]; then
   echo "Uso: <arquivo de senhas> "
   exit 1
fi
pass="$1"

if  [ ! -f "$pass" ]; then
   echo "Erro: arquivo '$pass' não encontrado"
   exit 1
fi

total=$(wc -l "$pass")
bas=$(grep "bash" "$pass" | wc -l)
nologin=$(grep "nologin" "$pass" | wc -l)
first5=$(grep "bash" "$pass" | head -5)


cat << EOF
Total de usuarios: $total
Total de usuarios com shell Bash: $bas
Total de usuarios com shell nologin: $nologin
Os 5 primeioros user com bash: $first5
EOF


