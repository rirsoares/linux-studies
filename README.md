# Linux Studies — Shell Script & Advanced Linux

Repositório de estudos estruturados em Shell Scripting e Administração/Recuperação Avançada de Linux.

Faz parte do meu ecossistema de repos de estudo. Scripts finalizados e prontos para uso são publicados nos repos dedicados:

| Repo relacionado | Descrição | Link |
|---|---|---|
| **shell-scripts** | Scripts de automação finalizados (Bash) | [rirsoares/shell-scripts](https://github.com/rirsoares/shell-scripts) |
| **linux-administration-labs** | Labs de administração Linux (LVM, RAID, SSH, Samba, NFS) | [rirsoares/linux-administration-labs](https://github.com/rirsoares/linux-administration-labs) |
| **Labs-TI** | Material de estudo geral (AWS, Cisco, Linux, VMware, Proxmox) | [rirsoares/Labs-TI](https://github.com/rirsoares/Labs-TI) |

## Estrutura do Repositório

```
linux-studies/
├── README.md               ← Este arquivo
├── CURRICULUM.md            ← Currículo completo com todos os módulos
├── PROGRESS.md              ← Tracker de progresso (atualizar a cada sessão)
├── CURRENT.md               ← Estado atual (colar no Claude para retomar)
│
├── parte1-shell-script/
│   ├── modulo-01-fundamentos/
│   │   ├── notas.md         ← Anotações da teoria
│   │   ├── exercicios/      ← Exercícios resolvidos
│   │   └── lab-01/          ← Lab do módulo
│   │       ├── README.md    ← Enunciado do lab
│   │       └── solucao.sh   ← Sua solução
│   └── ...
│
├── parte2-linux-avancado/
│   ├── modulo-09-boot/
│   │   ├── notas.md
│   │   └── lab-09/
│   └── ...
│
└── utils/
    ├── lib.sh               ← Biblioteca de funções (cresce ao longo do curso)
    └── templates/
        └── lab-template.md   ← Template para enunciado de labs
```

## Workflow: daqui para os repos dedicados

1. **Estudo e prática** acontecem aqui, com rascunhos, evolução e anotações
2. **Scripts finalizados** (limpos, comentados, testados) vão para [shell-scripts](https://github.com/rirsoares/shell-scripts)
3. **Labs de infraestrutura** (LVM, RAID, NFS, etc.) complementam o [linux-administration-labs](https://github.com/rirsoares/linux-administration-labs)

## Como usar com o Claude (Cowork mode)

### Fluxo de cada sessão de estudo

1. **Abrir sessão no Claude (Cowork mode)**
2. **Colar o conteúdo de `CURRENT.md`** — isso dá contexto para o Claude retomar
3. **Estudar** — teoria + prática guiada pelo Claude
4. **No final da sessão**, pedir ao Claude para atualizar CURRENT.md e PROGRESS.md
5. **Commitar:**
   ```bash
   git add -A
   git commit -m "sessao: modulo-XX topico Y.Z - descrição breve"
   git push
   ```

### Iniciar sessão

```
Oi Claude, vamos continuar meus estudos de Linux.
Aqui está meu estado atual:

[colar conteúdo do CURRENT.md]

Vamos continuar de onde paramos.
```

### Finalizar sessão

```
Vamos encerrar por hoje. Por favor atualize meu CURRENT.md e PROGRESS.md
com o que fizemos hoje.
```

## Ferramentas

- **VM:** VirtualBox/VMware com Ubuntu Server ou Rocky Linux
- **Editor:** vim
- **Linter:** [ShellCheck](https://github.com/koalaman/shellcheck)
- **Git:** versionamento dos estudos
- **Claude (Cowork):** tutor com continuidade via CURRENT.md
