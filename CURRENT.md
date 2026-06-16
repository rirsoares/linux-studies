# Estado Atual dos Estudos

**Cole este arquivo no início de cada sessão com o Claude para retomar de onde parou.** Repo: linux-studies | Repos relacionados: shell-scripts, linux-administration-labs

## Sessão Atual

- **Módulo:** 01 — Fundamentos Sólidos  
- **Tópico:** COMPLETO (teoria \+ Lab 01\)  
- **Status:** 🟢 Concluído  
- **Última sessão:** 2026-06-16  
- **Sessão \#:** 2

## O que foi feito na última sessão

- Lab 01: Script validador de ambiente (lab01-setup-check.sh)  
  - Aplica shebang, set \-euo pipefail, exit codes  
  - Arrays, variáveis locais, variáveis especiais ($1, aritmética)  
  - Aspas duplas em tudo, aspas simples em literais, command substitution $()  
  - Funções básicas (preview do módulo 03\)  
- Esclarecimento sobre diferença entre globbing e regex  
- Ajuste no método de ensino: código e saídas no texto (não em blocos recolhidos)

## O que fazer na próxima sessão

- Iniciar Módulo 02: Controle de Fluxo  
  - 2.1 Condicionais: if/elif/else, test, \[\[ \]\], operadores  
  - 2.2 Case statements e pattern matching  
  - 2.3 Loops: for, while, until, break, continue  
  - Lab 02: Script de auditoria de sistema

## Dificuldades/Dúvidas pendentes

- Configurar SSH para GitHub (usando HTTPS por enquanto)  
- Globbing vs regex: esclarecido, aprofundar regex no Módulo 05

## Scripts publicados em repos dedicados

(Nenhum ainda — lab01-setup-check.sh é candidato após revisão)

## Anotações rápidas

- Sempre usar set \-euo pipefail no topo dos scripts  
- Sempre usar "$var" com aspas duplas (evita word splitting)  
- Usar "$@" (não "$\*") para iterar argumentos  
- Usar $() em vez de backticks para command substitution  
- ${var:-} para variáveis que podem não existir (evita erro com set \-u)  
- command \-v é melhor que which para testar se comando existe  
- || true evita que set \-e mate o script em comandos que podem falhar  
- GLOB \= nomes de arquivos (shell), REGEX \= padrões em texto (grep/sed/awk)

## Nota sobre formato das aulas

- Claude deve mostrar código e saídas DIRETAMENTE no texto da conversa  
- Não depender dos blocos recolhidos de tool calls para conteúdo didático

