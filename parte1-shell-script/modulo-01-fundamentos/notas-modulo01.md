# Módulo 01 — Fundamentos Sólidos

## 1.1 — Anatomia de um Script

### Shebang

- `#!/bin/bash` — caminho direto para o interpretador  
- `#!/usr/bin/env bash` — mais portável, busca no PATH  
- Sem shebang, o sistema usa o shell padrão (pode ser dash, não bash)  
- Diferença prática: arrays e `[[ ]]` NÃO funcionam em sh/dash

### set \-euo pipefail

| Flag | Efeito | Sem ela |
| :---- | :---- | :---- |
| `-e` | Para no primeiro erro | Erros ignorados silenciosamente |
| `-u` | Erro ao usar variável não definida | Variável vazia, bug difícil de achar |
| `-o pipefail` | Pipeline falha se qualquer comando falhar | Só o exit code do último comando conta |

**Regra: sempre usar `set -euo pipefail` no topo.**

### Exit codes

| Código | Significado |
| :---- | :---- |
| 0 | Sucesso |
| 1 | Erro genérico |
| 2 | Uso incorreto |
| 126 | Permissão negada |
| 127 | Comando não encontrado |
| 128+N | Morto por sinal N (137 \= kill \-9) |

- Acessar com `$?` após qualquer comando  
- Controlar saída do script com `exit N`

---

## 1.2 — Variáveis

### Declaração

- `nome="valor"` — SEM espaços ao redor do `=`  
- `nome = "valor"` — ERRO (bash interpreta "nome" como comando)

### Local vs exportada

- `var="x"` — só existe no processo atual  
- `export VAR="x"` — visível para processos filhos (subshells)  
- Convenção: `MAIÚSCULAS` \= exportadas/ambiente, `minúsculas` \= locais

### Variáveis especiais

| Variável | Significado | Quando usar |
| :---- | :---- | :---- |
| `$0` | Nome do script | Mensagens de erro/uso |
| `$1`\-`$9` | Argumentos posicionais | Receber input |
| `$#` | Quantidade de argumentos | Validar input |
| `"$@"` | Todos os args (separados) | Iterar sobre args |
| `"$*"` | Todos os args (uma string) | Raramente |
| `$?` | Exit code último comando | Checar sucesso/falha |
| `$$` | PID do processo | Lock files, temp files |
| `$!` | PID do último bg job | Gerenciar processos |

**"$@" vs "$\*":** `"$@"` preserva cada argumento separado (respeita espaços). Sempre usar `"$@"`.

---

## 1.3 — Quoting

### Tipos de aspas

| Tipo | Expande $var? | Expande $(cmd)? | Expande glob \*? | Usar quando |
| :---- | :---: | :---: | :---: | :---- |
| `"duplas"` | Sim | Sim | Não | Padrão — maioria dos casos |
| `'simples'` | Não | Não | Não | Regex, sed, awk, literal |
| sem aspas | Sim | Sim | Sim | Só para glob intencional |

### Word splitting (o perigo de não usar aspas)

arquivo="meu arquivo.txt"

ls $arquivo    \# ERRO: tenta ls em "meu" e "arquivo.txt" separados

ls "$arquivo"  \# CORRETO: trata como um argumento só

**Regra: sempre use aspas duplas em variáveis: `"$var"`**

### $() vs backticks

- `$(comando)` — forma moderna, permite aninhar, legível  
- `` `comando` `` — forma antiga, evitar

### Globbing

| Padrão | Casa com |
| :---- | :---- |
| `*` | Qualquer coisa |
| `?` | Exatamente 1 caractere |
| `[abc]` | Um caractere da lista |
| `[a-z]` | Um caractere do range |
| `{*.pdf,*.txt}` | Múltiplas extensões (brace expansion) |

