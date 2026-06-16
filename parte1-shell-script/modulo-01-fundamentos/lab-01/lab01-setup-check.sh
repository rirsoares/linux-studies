#!/bin/bash
# =============================================================================
# Lab 01 — Validador de ambiente para o curso Linux Studies
# Autor: Ricardo Ribeiro
# Data: 2026-06-16
# Descrição: Verifica se o sistema tem os pré-requisitos para o curso
# Uso: bash lab01-setup-check.sh
# =============================================================================

set -euo pipefail

# ---------------------------------------------------------------------------
# VARIÁVEIS DE CONFIGURAÇÃO
# ---------------------------------------------------------------------------
# Comandos obrigatórios que o curso precisa
REQUIRED_CMDS=("bash" "git" "vim" "grep" "sed" "awk" "curl" "ssh" "ip" "systemctl")

# Espaço mínimo em disco (em MB)
MIN_DISK_MB=1000

# Contadores de resultado
pass=0
fail=0
warn=0

# ---------------------------------------------------------------------------
# FUNÇÕES AUXILIARES
# ---------------------------------------------------------------------------
# Perceba: ainda não estudamos funções (Módulo 03), mas aqui é uso básico
# para não repetir código. Cada função recebe parâmetros via $1, $2.

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

# ---------------------------------------------------------------------------
# INÍCIO DAS VERIFICAÇÕES
# ---------------------------------------------------------------------------
echo "============================================="
echo "  Lab 01 — Validador de Ambiente"
echo "  Data: $(date '+%Y-%m-%d %H:%M:%S')"
echo "  Host: $(hostname)"
echo "  User: $(whoami)"
echo "============================================="
echo ""

# --- 1. Verificar se está rodando com bash ---
echo "[1] Shell em uso"
if [[ -n "${BASH_VERSION:-}" ]]; then
    resultado_ok "Bash $BASH_VERSION"
else
    resultado_fail "Não está rodando em bash"
fi
echo ""

# --- 2. Verificar comandos obrigatórios ---
echo "[2] Comandos obrigatórios"
for cmd in "${REQUIRED_CMDS[@]}"; do
    if command -v "$cmd" > /dev/null 2>&1; then
        # Pegando a versão (só a primeira linha, truncada)
        versao=$(("$cmd" --version 2>/dev/null || true) | head -1 | cut -c1-60)
        resultado_ok "$cmd — $versao"
    else
        resultado_fail "$cmd não encontrado"
    fi
done
echo ""

# --- 3. Verificar versão do Git ---
echo "[3] Versão do Git"
if command -v git > /dev/null 2>&1; then
    git_version=$(git --version | grep -oP '[0-9]+\.[0-9]+')
    # Comparação simples: versão principal >= 2
    git_major=$(echo "$git_version" | cut -d. -f1)
    if [[ "$git_major" -ge 2 ]]; then
        resultado_ok "Git $git_version (>= 2.x)"
    else
        resultado_warn "Git $git_version (recomendado >= 2.x)"
    fi
else
    resultado_fail "Git não instalado"
fi
echo ""

# --- 4. Verificar espaço em disco ---
echo "[4] Espaço em disco"
# df -m: saída em MB, awk pega a coluna "Available" da partição /
disk_avail=$(df -m / | awk 'NR==2 {print $4}')
if [[ "$disk_avail" -ge "$MIN_DISK_MB" ]]; then
    resultado_ok "${disk_avail}MB livres (mínimo: ${MIN_DISK_MB}MB)"
else
    resultado_fail "${disk_avail}MB livres (precisa de pelo menos ${MIN_DISK_MB}MB)"
fi
echo ""

# --- 5. Verificar se é root ---
echo "[5] Permissões"
if [[ $(id -u) -eq 0 ]]; then
    resultado_warn "Rodando como root (cuidado em produção)"
else
    resultado_ok "Rodando como usuário normal: $(whoami)"
fi
echo ""

# --- 6. Verificar conectividade ---
echo "[6] Conectividade"
if curl -s --max-time 5 https://github.com > /dev/null 2>&1; then
    resultado_ok "Acesso ao GitHub OK"
else
    resultado_warn "Sem acesso ao GitHub (verificar rede)"
fi
echo ""

# ---------------------------------------------------------------------------
# RELATÓRIO FINAL
# ---------------------------------------------------------------------------
echo "============================================="
echo "  RESULTADO"
echo "============================================="
echo "  OK:    $pass"
echo "  FAIL:  $fail"
echo "  WARN:  $warn"
echo "  Total: $((pass + fail + warn)) verificações"
echo "============================================="

# Exit code reflete o resultado
if [[ "$fail" -gt 0 ]]; then
    echo ""
    echo "Ambiente NÃO está pronto. Corrija os itens FAIL acima."
    exit 1
else
    echo ""
    echo "Ambiente pronto para o curso!"
    exit 0
fi
