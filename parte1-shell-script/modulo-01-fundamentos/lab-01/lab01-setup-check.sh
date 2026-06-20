#!/bin/bash
# =============================================================================
# Lab 01 — Validador de ambiente para o curso Linux Studies
# Autor: Ricardo Ribeiro
# Data: 2026-06-16
# Descrição: Verifica se o sistema tem os pré-requisitos para o curso
# Uso: bash lab01-setup-check.sh
# =============================================================================

set -euo pipefail

# Comandos obrigatórios que o curso precisa
REQUIRED_CMDS=("bash" "git" "vim" "grep" "sed" "awk" "curl" "ssh" "ip" "systemctl")

# Espaço mínimo em disco (em MB)
MIN_DISK_MB=1000

# Contadores de resultado
pass=0
fail=0
warn=0

resultado_ok() {
    echo "  [OK]    $1"
    pass=$((pass + 1))
}

resultado_fail() {
    echo "  [FAIL]  $1"
    fail=$((fail + 1))
}

resultado_warn() {
    echo "  [WARN]  $1"
    warn=$((warn + 1))
}


echo "============================================="
echo "  Lab 01 — Validador de Ambiente"
echo "  Data: $(date '+%Y-%m-%d %H:%M:%S')"
echo "  Host: $(hostname)"
echo "  User: $(whoami)"
echo "============================================="


echo "[1] Shell em uso"
if [[ -n "${BASH_VERSION:-}" ]]; then
    resultado_ok "Bash $BASH_VERSION"
else
    resultado_fail "Não está rodando em bash"
fi

# :- é um truque: se a variável não existir, 
# retorna vazio em vez de dar erro com set -u
#
echo "[2] Comandos obrigatórios"
for cmd in "${REQUIRED_CMDS[@]}"; do
    if command -v "$cmd" > /dev/null 2>&1; then
        versao=$(("$cmd" --version 2>/dev/null || true) | head -1 | cut -c1-60)
        resultado_ok "$cmd — $versao"
    else
        resultado_fail "$cmd não encontrado"
    fi
done

echo "[4] Espaço em disco"
disk_avail=$(df -m / | awk 'NR==2 {print $4}')
if [[ "$disk_avail" -ge "$MIN_DISK_MB" ]]; then
    resultado_ok "${disk_avail}MB livres (mínimo: ${MIN_DISK_MB}MB)"
else
    resultado_fail "${disk_avail}MB livres (precisa de pelo menos ${MIN_DISK_MB}MB)"
fi

echo "============================================="
echo "  RESULTADO"
echo "============================================="
echo "  OK:    $pass"
echo "  FAIL:  $fail"
echo "  WARN:  $warn"
echo "  Total: $((pass + fail + warn)) verificações"
echo "============================================="

if [[ "$fail" -gt 0 ]]; then
    echo "Ambiente NÃO está pronto."
    exit 1
else
    echo "Ambiente pronto para o curso!"
    exit 0
fi
