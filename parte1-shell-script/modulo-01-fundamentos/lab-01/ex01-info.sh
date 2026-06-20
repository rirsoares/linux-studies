#!/bin/bash
# =============================================================================
# Ex01 — Meu primeiro script
# Autor: Ricardo Ribeiro
# Data: 2026-06-16
# Descrição: Exibir informações do usuario logado
# Uso: bash ex01-info.sh
# =============================================================================

set -euo pipefail
clear
echo "Eu sou Ricardo Ribeiro"
echo "Hoje é:" $(date '+%Y-%m-%d %H:%M:%S')
echo "O nome do Host é: $(hostname)"
echo "O Usuario logado é: $(whoami)"
echo "Meu shell é: $SHELL"
echo "Meu diretorio atual é: $(pwd)"


