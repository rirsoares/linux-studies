#!/bin/bash
# =============================================================================
# Lab 05 —  ex04-sysinfo.sh - Linux Studies
# Autor: Ricardo Ribeiro
# Data: 2026-06-18
# Descrição: Fornece informaçoes do sistema 
# Uso: bash  ex05-sysinfo.sh
# =============================================================================

set -euo pipefail


clear

ver=$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2 )
ker=$(uname -r)
up=$(uptime -p)
cpu=$(nproc)
mem=$(free -h | awk '/Mem/ {print "Total:", $2, "Livre:", $4}')
dsk=$(df -h / | awk 'NR==2 {print "Usado:", $3, "De:", $2, "("$5")"}')
ipr=$(hostname -I | awk '{print $1}')

#com cat
cat << EOF
 Versão da Distro: $ver
 Versão do Kernel: $ker
 Tempo de Atividade: $up
 Numero de Cores: $cpu
 Memoria Virtual: $mem
 Utilização do Disco: $dsk
 IP Principal: $ipr
EOF

#Com echo
#echo "Versão da Distro: $ver"
#echo "Versão do Kernel: $ker"
#echo "Tempo de Atividade: $up"
#echo "Numero de Cores: $cpu"
#echo "Memoria Virtual: $mem"
#echo "Utilização do Disco: $dsk"
#echo "IP Principal: $ipr"


