# Currículo: Shell Script & Linux Avançado

> Nível: Intermediário → Avançado
> Frequência: 2-3 sessões/semana (~60-90 min cada)
> Duração estimada: 12-16 semanas

---

## PARTE 1 — SHELL SCRIPTING (Semanas 1-8)

### Módulo 01 · Fundamentos Sólidos (Semana 1)
- **1.1** Anatomia de um script: shebang, exit codes, set -euo pipefail
- **1.2** Variáveis: escopo, local, export, variáveis especiais ($?, $$, $!, $@, $#)
- **1.3** Quoting: single, double, backticks vs $(), globbing
- **Lab 01:** Script de setup de ambiente que valida pré-requisitos

### Módulo 02 · Controle de Fluxo (Semana 2)
- **2.1** Condicionais: if/elif/else, test, [[ ]], operadores
- **2.2** Case statements e pattern matching
- **2.3** Loops: for, while, until, loop controls (break, continue)
- **Lab 02:** Script de auditoria de sistema (verifica users, serviços, portas)

### Módulo 03 · Funções e Modularização (Semana 3)
- **3.1** Declaração, parâmetros, return vs echo
- **3.2** Escopo de variáveis em funções (local, global)
- **3.3** Source/include de bibliotecas, organização de código
- **Lab 03:** Biblioteca de funções utilitárias reutilizável + script que a consome

### Módulo 04 · Processamento de Texto (Semanas 3-4)
- **4.1** grep, sed — patterns, substituições, in-place editing
- **4.2** awk — fields, patterns, BEGIN/END, arrays associativos
- **4.3** cut, tr, sort, uniq, paste, column, tee
- **4.4** Pipelines complexos e composição de comandos
- **Lab 04:** Parser de logs do Apache/Nginx com relatório formatado

### Módulo 05 · Expressões Regulares (Semana 5)
- **5.1** BRE vs ERE, PCRE (grep -P)
- **5.2** Grupos de captura, backreferences, lookahead/lookbehind
- **5.3** Regex em sed, awk, grep, bash [[ =~ ]]
- **Lab 05:** Validador de configurações (IPs, emails, paths, permissões)

### Módulo 06 · I/O Avançado e Processos (Semana 5-6)
- **6.1** File descriptors, redirecionamento avançado (2>&1, &>, >())
- **6.2** Here documents, here strings, process substitution
- **6.3** Named pipes (FIFOs), /dev/fd/
- **6.4** Signals e traps (SIGTERM, SIGINT, EXIT, ERR)
- **6.5** Background jobs, wait, parallel execution
- **Lab 06:** Script de backup com logging, lock file, trap de cleanup e execução paralela

### Módulo 07 · Scripting de Sistema (Semana 7)
- **7.1** Manipulação de arquivos e diretórios em massa
- **7.2** Interação com systemd (systemctl, journalctl via script)
- **7.3** Cron, at, timers do systemd
- **7.4** Gerenciamento de usuários e permissões via script
- **Lab 07:** Script de provisionamento de servidor (users, pacotes, firewall, serviços)

### Módulo 08 · Técnicas Avançadas (Semana 8)
- **8.1** Arrays indexados e associativos, manipulação avançada
- **8.2** Parameter expansion avançado (${var//}, ${var:+}, etc.)
- **8.3** Getopts e parsing de argumentos robusto
- **8.4** Debug: set -x, PS4, bashdb, shellcheck
- **8.5** Performance: builtins vs external commands, benchmarking
- **Lab 08:** Ferramenta CLI completa com subcomandos, help, config file, logging

---

## PARTE 2 — RECUPERAÇÃO E ADMINISTRAÇÃO AVANÇADA DE LINUX (Semanas 9-16)

### Módulo 09 · Boot Process Profundo (Semana 9)
- **9.1** BIOS/UEFI → bootloader → kernel → initramfs → init/systemd
- **9.2** GRUB2: configuração, rescue, reinstalação
- **9.3** Kernel parameters, initramfs: mkinitramfs/dracut
- **9.4** Systemd targets, emergency.target, rescue.target
- **Lab 09:** Quebrar e recuperar GRUB em VM (cenários progressivos)

### Módulo 10 · Filesystem e Storage (Semana 10)
- **10.1** ext4, xfs, btrfs — internals, journal, superblock
- **10.2** fsck, xfs_repair, debugfs, tune2fs
- **10.3** LVM: criação, extensão, snapshots, migração, recovery
- **10.4** RAID: mdadm, reconstrução, falhas
- **Lab 10:** Recuperar filesystem corrompido + reconstruir array RAID degradado

### Módulo 11 · Recuperação de Dados (Semana 11)
- **11.1** Princípios: inode, data blocks, journal replay
- **11.2** Ferramentas: testdisk, photorec, extundelete, ddrescue
- **11.3** Disk imaging para forense (dd, dcfldd)
- **11.4** Recuperação de partições perdidas/sobrescritas
- **Lab 11:** Cenário de desastre: recuperar partição deletada e arquivos em VM

### Módulo 12 · Rede — Diagnóstico e Recuperação (Semana 12)
- **12.1** NetworkManager, systemd-networkd, configuração manual
- **12.2** Troubleshooting: ip, ss, tcpdump, nmap, traceroute, mtr
- **12.3** Firewall: iptables/nftables, diagnóstico de regras
- **12.4** DNS: resolução, cache, dig, configuração
- **12.5** Cenários: máquina sem rede após update, bridge quebrada, VPN
- **Lab 12:** Diagnosticar e corrigir 5 cenários de rede quebrada em VM

### Módulo 13 · Systemd Profundo (Semana 13)
- **13.1** Unit files: anatomia, dependências, ordering
- **13.2** Timers, sockets, paths, automount
- **13.3** Journald: configuração, persistência, filtragem avançada
- **13.4** cgroups v2, resource control, slices
- **13.5** Análise de boot: systemd-analyze blame/critical-chain
- **Lab 13:** Criar unit complexa com watchdog, restart policy, resource limits

### Módulo 14 · Kernel e Performance (Semana 14)
- **14.1** Kernel panic: análise, kdump, crash
- **14.2** Módulos: lsmod, modprobe, blacklist, DKMS
- **14.3** sysctl tuning, /proc, /sys
- **14.4** Performance: top/htop, vmstat, iostat, sar, perf, strace
- **14.5** OOM killer, memory pressure, swap tuning
- **Lab 14:** Diagnosticar servidor lento (CPU, I/O, memória) + tuning

### Módulo 15 · Segurança e Hardening (Semana 15)
- **15.1** SELinux/AppArmor: modos, troubleshooting, policies
- **15.2** PAM: configuração, módulos, troubleshooting de auth
- **15.3** SSH hardening, auditd, fail2ban
- **15.4** Análise pós-invasão: checklist, ferramentas, logs
- **Lab 15:** Hardening completo de um servidor + análise de logs suspeitos

### Módulo 16 · Projeto Final — Disaster Recovery (Semana 16)
- **16.1** Planejamento de DR: RTO, RPO, runbooks
- **16.2** Backup strategy: rsync, borgbackup, snapshots LVM/btrfs
- **16.3** Automação de recovery com scripts
- **Lab Final:** Cenário completo — servidor com múltiplos problemas simultâneos:
  - GRUB corrompido
  - Filesystem com erros
  - Serviço crítico falhando
  - Rede parcialmente quebrada
  - Recuperar, documentar processo, criar runbook de prevenção

---

## Método de Avaliação por Módulo

| Nível | Critério |
|-------|----------|
| ⬜ Não iniciado | — |
| 🟡 Em andamento | Estudou a teoria, lab incompleto |
| 🟢 Concluído | Lab feito e funcionando |
| ⭐ Dominado | Consegue explicar e adaptar para cenários novos |

---

## Ferramentas Necessárias
- VM Linux (Ubuntu Server ou Rocky Linux) — VirtualBox ou VMware
- Editor de texto (vim recomendado)
- Git + conta GitHub
- ShellCheck (linter de shell scripts)
- Acesso root na VM para os labs de recuperação

---

## Publicação em Repos Dedicados

Scripts e labs finalizados devem ser publicados nos repos curados:

| Módulos | Repo destino | O que publicar |
|---------|-------------|----------------|
| 01-08 (Shell Script) | [shell-scripts](https://github.com/rirsoares/shell-scripts) | Scripts finalizados, limpos e comentados |
| 09-16 (Linux Avançado) | [linux-administration-labs](https://github.com/rirsoares/linux-administration-labs) | Runbooks, procedimentos e scripts de automação |
| Qualquer | [Labs-TI](https://github.com/rirsoares/Labs-TI) | Anotações e materiais de referência complementares |

### Critérios para publicar no repo dedicado
1. Script testado e funcionando
2. Comentários claros explicando o que faz
3. Header padrão (autor, data, descrição, uso)
4. Passou no ShellCheck sem warnings
