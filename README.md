<img align="right" src="images/rock_tools.jpg" alt="Stone tools" width="30%">

## **mousterian-ux**

A workspace toolkit for bioinformaticians who move between systems.

Named after the Mousterian stone tools which worked across continents for 300,000 years. This repo will probably need updating next month. But the principle is the same: carry tools that work anywhere.

This repo sets up a productive workspace with one command. It installs what you need, configures what helps, and stays close to defaults so you can feel at home on any Linux machine.


### What is this?

A bootstrap script that turns a fresh Ubuntu install (or an HPC account) into a working environment for computational biology.

It backs up your existing configs, installs useful tools, sets up conda/mamba, and deploys sensible dotfiles. Nothing fancy. Nothing fragile.

**This is not the best setup.** It's *my* setup - an evolutionary bioinformatician who works mostly with genomics. It works well for me. It might work for you. Or it might be a starting point for something better.

Heavily inspired by [Omakub](https://omakub.org/) by DHH, but tilted toward science rather than web development.

**OBS!** This is a work in progress and is not finalized yet.

---

### Quick start and a warning...
There are no current fail safes. No current ways to undo. Read the scripts so you understand what will occur. You do this on your own risk at the moment.
```bash
git clone https://github.com/ndreey/mousterian-ux.git
cd mousterian-ux
bash mousterian-ux.sh
```

Choose your mode when prompted.


---

### Installation modes

| Mode | What it does | Needs sudo? |
|------|--------------|-------------|
| **Fresh Ubuntu** | Full desktop setup with apps, GNOME tweaks, mamba, dotfiles | Yes |
| **HPC environment** | Lightweight setup for clusters — mamba, basic tools, safe dotfiles | No |
| **Dotfiles only** | Just deploy configs, install nothing | No |
| **Check system** | See what you're working with before committing | No |

---

### What gets installed

#### Terminal tools
`tmux` · `tree` · `vim` · `stow` · `pipx` · build essentials

#### Desktop apps (Ubuntu mode)
VS Code · Obsidian · Inkscape · VLC · LibreOffice · Flameshot · LocalSend · Ulauncher

#### Mamba environments for basics
- **cli** — everyday tools (pigz, wget, curl, git)
- **qc** — quality control (pigz, seqkit, bbmap, multiqc, fastqc, samtools, bedtools, bzip2)

#### GNOME tweaks
- Workspace switching with `Super+1/2/3/4/5/6`
- Window moving with `Super+Shift+1/2/3/4/5/6`
- Clean dock, alphabetical app grid
- A few tasteful extensions (blur, space-bar, just-perfection)

---

### Dotfiles included

| Config | What it sets up |
|--------|-----------------|
| bash | Aliases, history, PATH, prompt |
| git | Name, email, sensible defaults (mine, customize this yourself)|
| vscode | Editor settings, extensions, themes|
| gtk | Theme preferences |
| ulauncher | App launcher settings |

Configs are copied (not symlinked) to keep things simple. Your old configs are backed up to `~/oldowan-backup/` with a timestamp, just in case.

---

### Project structure
```
mousterian-ux/
├── mousterian-ux.sh          # start here
├── init/                     # orchestration scripts
├── install/                  # package installers
│   ├── terminal/             # CLI tools
│   ├── desktop/              # GNOME apps and tweaks
│   └── mamba/                # conda/mamba setup
├── stow/                     # dotfile deployment
├── backup/                   # config backup script
└── dotfiles/                 # the actual configs
    ├── bash/
    ├── git/
    ├── vscode/
    └── ...
```

---


### Requirements

- Ubuntu 22.04+ (desktop mode) or any Linux with bash (HPC mode)
- Internet connection
- About 5-25 minutes and a cup of coffee

---

### Acknowledgments

This project is inspired by [Omakub](https://omakub.org/), which does something similar for web developers. If you're not doing science, Omakub is probably what you want.



Illustrations are by **Zdenek Burian** from the books "*Great Discoveries*" and "*Life-Blown*" published in 1957 and 1962. All rights remain with the original author(s).





---

<div align="center">
  <img src="images/journey.jpg" alt="The journey continues" width="100%">
  <br>
  <em>Pack light. Travel far </em>
</div>
