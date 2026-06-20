#!/bin/bash
# =============================================================================
# Lab 03 —  ex03-debug-args.sh - Linux Studies
# Autor: Ricardo Ribeiro
# Data: 2026-06-17
# Descrição: Digitar argumentos e mostre TODAS as variáveis especiais 
# Uso: bash  ex03-debug-args.sh
# =============================================================================

set -euo pipefail

clear
nome="$0"
pid="$$"
total_args="$#"
echo "Programa: $nome"
echo "PID: $pid"
echo "Numero de argumentos: $total_args"
todos="$@"
cont=1
for arg in "$@"; do 
   echo "Argumento:$cont  $arg"
   cont=$((cont + 1))
done
echo "Todos: (\$@): $*" 

