# Exercícios — Módulo 01: Fundamentos Sólidos

Cada exercício deve ser um script `.sh` separado. Todos devem ter: shebang, header com comentários, e `set -euo pipefail`. Teste cada um na sua VM ou Git Bash.

---

## Nível 1 — Aquecimento

### Ex01 — Meu primeiro script

Crie um script `ex01-info.sh` que exiba:

- Seu nome (hardcoded em variável)  
- Data e hora atuais  
- Nome do host  
- Usuário logado  
- Shell em uso  
- Diretório atual

**Saída esperada:**

Nome: Ricardo Ribeiro

Data: 2026-06-16 20:30:00

Host: minha-vm

User: ricardo

Shell: /bin/bash

Dir: /home/ricardo

**Conceitos:** variáveis, command substitution `$()`, aspas duplas

---

### Ex02 — Argumentos

Crie um script `ex02-saudacao.sh` que receba o nome como argumento e exiba uma saudação. Se não receber argumento, mostre uma mensagem de uso e saia com exit code 1\.

\# Uso:

bash ex02-saudacao.sh Ricardo

\# Saída: Olá, Ricardo\! Bem-vindo ao curso.

bash ex02-saudacao.sh

\# Saída: Uso: ex02-saudacao.sh \<nome\>

\# Exit code: 1

**Conceitos:** `$1`, `$#`, exit codes

---

### Ex03 — Variáveis especiais

Crie um script `ex03-debug-args.sh` que receba qualquer quantidade de argumentos e mostre TODAS as variáveis especiais que aprendemos.

bash ex03-debug-args.sh foo "bar baz" 42

\# Saída:

\# Script: ex03-debug-args.sh

\# PID: 12345

\# Total de args: 3

\# Arg 1: foo

\# Arg 2: bar baz

\# Arg 3: 42

\# Todos ($@): foo bar baz 42

**Conceitos:** `$0`, `$$`, `$#`, `$1`\-`$N`, `"$@"`

---

## Nível 2 — Prática

### Ex04 — Verificador de arquivo

Crie um script `ex04-file-check.sh` que receba um caminho como argumento e informe:

- Se o arquivo existe ou não  
- Se é arquivo regular ou diretório  
- Tamanho (se existir)  
- Permissões (se existir)

bash ex04-file-check.sh /etc/passwd

\# Saída:

\# Arquivo: /etc/passwd

\# Tipo: arquivo regular

\# Tamanho: 2847 bytes

\# Permissões: \-rw-r--r--

**Dica:** use `test -f`, `test -d`, `stat` ou `ls -la` **Conceitos:** variáveis, quoting (caminhos com espaço\!), exit codes

---

### Ex05 — Informações do sistema

Crie um script `ex05-sysinfo.sh` que mostre um relatório do sistema:

- Distribuição Linux (leia de `/etc/os-release`)  
- Kernel (`uname -r`)  
- Uptime (`uptime -p`)  
- CPUs (`nproc`)  
- Memória total e livre (de `/proc/meminfo` ou `free -h`)  
- Disco: uso da partição `/` (`df -h /`)  
- IP principal (`hostname -I` ou `ip addr`)

**Conceitos:** command substitution, pipelines, variáveis, formatação de saída

---

### Ex06 — Calculadora de argumentos

Crie um script `ex06-calc.sh` que receba dois números como argumentos e mostre as 4 operações.

bash ex06-calc.sh 15 4

\# Saída:

\# 15 \+ 4 \= 19

\# 15 \- 4 \= 11

\# 15 \* 4 \= 60

\# 15 / 4 \= 3 (resto: 3\)

Valide que recebeu exatamente 2 argumentos. Se não, mostre uso e saia com exit code 2\.

**Conceitos:** `$#`, `$1`, `$2`, aritmética `$((...))`, exit codes

---

## Nível 3 — Desafio

### Ex07 — Backup simples

Crie um script `ex07-backup.sh` que receba um arquivo como argumento e crie uma cópia com a data no nome.

bash ex07-backup.sh /etc/nginx/nginx.conf

\# Cria: /etc/nginx/nginx.conf.bkp.2026-06-16

\# Saída: Backup criado: /etc/nginx/nginx.conf.bkp.2026-06-16

Se o arquivo não existir, saia com erro. Se o backup já existir, avise e não sobrescreva.

**Conceitos:** variáveis, command substitution, quoting (caminhos\!), exit codes, test \-f

---

### Ex08 — Gerador de relatório de usuários

Crie um script `ex08-users.sh` que leia `/etc/passwd` e gere um relatório:

- Total de usuários  
- Total de usuários com shell `/bin/bash`  
- Total de usuários com shell `/usr/sbin/nologin`  
- Listar os 5 primeiros usuários com bash

**Dica:** use `grep`, `wc -l`, `head`, `cut` **Conceitos:** command substitution, pipelines, variáveis, formatação

---

### Ex09 — Validador de variáveis de ambiente

Crie um script `ex09-env-check.sh` que receba uma lista de nomes de variáveis como argumentos e verifique se cada uma está definida no ambiente.

bash ex09-env-check.sh HOME PATH JAVA\_HOME GOPATH

\# Saída:

\# \[OK\]   HOME \= /home/ricardo

\# \[OK\]   PATH \= /usr/local/bin:/usr/bin:...

\# \[FAIL\] JAVA\_HOME não está definida

\# \[FAIL\] GOPATH não está definida

\# Resultado: 2/4 definidas

**Conceitos:** `"$@"`, variáveis indiretas (`${!var}`), contadores, exit codes

---

### Ex10 — Script auto-documentado

Crie um script `ex10-self-doc.sh` que, quando executado com `--help`, mostre documentação extraída dos próprios comentários do header. Sem `--help`, execute sua função normal (pode ser qualquer coisa simples).

bash ex10-self-doc.sh \--help

\# Mostra: nome, descrição, uso, exemplos (tudo vindo dos comentários \#)

bash ex10-self-doc.sh

\# Executa normalmente

**Dica:** use `grep` ou `sed` no próprio `$0` para extrair linhas que começam com `#` **Conceitos:** `$0`, `$1`, command substitution, quoting, leitura do próprio script

---

## Como organizar no repo

parte1-shell-script/modulo-01-fundamentos/exercicios/

├── ex01-info.sh

├── ex02-saudacao.sh

├── ex03-debug-args.sh

├── ex04-file-check.sh

├── ex05-sysinfo.sh

├── ex06-calc.sh

├── ex07-backup.sh

├── ex08-users.sh

├── ex09-env-check.sh

└── ex10-self-doc.sh

Commite cada exercício conforme for fazendo:

git add \-A

git commit \-m "exercicio: ex01 info do sistema"

git push

## Dicas gerais

- Sempre comece com `#!/bin/bash` e `set -euo pipefail`  
- Sempre use aspas duplas em variáveis: `"$var"`  
- Teste com entradas inválidas (sem argumentos, arquivo inexistente, etc.)  
- Rode `shellcheck seu-script.sh` se tiver o ShellCheck instalado  
- Se travar, releia suas notas em `notas.md` do módulo 01

