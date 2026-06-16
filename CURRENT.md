# Estado Atual dos Estudos

**Cole este arquivo no início de cada sessão com o Claude para retomar de onde parou.** Repo: linux-studies | Repos relacionados: shell-scripts, linux-administration-labs

## Sessão Atual

- **Módulo:** 01 — Fundamentos Sólidos  
- **Tópico:** Teoria completa (1.1, 1.2, 1.3) — falta Lab 01  
- **Status:** 🟡 Em andamento  
- **Última sessão:** 2026-06-16  
- **Sessão \#:** 1

## O que foi feito na última sessão

- 1.1 Anatomia de um script: shebang (\#\!/bin/bash vs \#\!/usr/bin/env bash), set \-euo pipefail (cada flag explicada com exemplos), exit codes (0-255, convenções)  
- 1.2 Variáveis: declaração (sem espaço no \=), export vs local, convenção MAIÚSCULAS/minúsculas, variáveis especiais ($0, $1-$9, $\#, "$@" vs "$\*", $?, $$, $\!)  
- 1.3 Quoting: aspas duplas (expande $var), simples (literal), sem aspas (word splitting perigoso), $() vs backticks, globbing (\*, ?, \[\], {})

## O que fazer na próxima sessão

- Lab 01: Script de setup de ambiente que valida pré-requisitos (aplica tudo do módulo 01\)  
- Se sobrar tempo: iniciar Módulo 02 (Controle de Fluxo)

## Dificuldades/Dúvidas pendentes

- Configurar SSH para GitHub (usar HTTPS por enquanto)

## Scripts publicados em repos dedicados

(Nenhum ainda — scripts finalizados dos labs vão para rirsoares/shell-scripts)

## Anotações rápidas

- Sempre usar set \-euo pipefail no topo dos scripts  
- Sempre usar "$var" com aspas duplas (evita word splitting)  
- Usar "$@" (não "$\*") para iterar argumentos  
- Usar $() em vez de backticks para command substitution

