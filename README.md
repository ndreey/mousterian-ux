# mousterian-ux

**Fast setup for Ubuntu and HPC work environments.**

```

           ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
           ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠲⠦⠤⣄⣀⠀⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
           ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣀⠀⠀⠀⠀⠀⠘⠿⠟⠀⢤⠀⣠⣤⣄⠀⠀⠀
           ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⡆⠀⠀⠀⠀⢰⡖⠀⠀⠀⠀⠙⠿⠿⠓⠀⠀
           ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⠃⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
           ⠀⠀⠀⠀⠀⢀⣠⣤⣤⣤⣄⡉⠁⣠⡄⢀⣀⣼⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
           ⠀⠀⠀⠀⣰⣿⣿⠟⣿⣿⡿⠁⣴⣿⠁⡸⠿⠿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
           ⠀⠀⠀⢰⡿⠋⠀⢰⠿⠋⡀⢈⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
           ⠀⠀⠀⣿⡇⠀⠀⠠⠴⣾⣿⣿⣯⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
           ⠀⠀⠀⠉⠁⠀⠀⢀⣀⣼⣿⡿⠿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
           ⠀⠀⠀⠀⠀⠀⠀⠈⠛⣿⠿⣄⠀⢠⣾⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
           ⠀⠀⠀⠀⠀⠀⢀⣿⠀⠁⠀⠁⠀⠀⠉⢿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
           ⠀⢀⣤⣤⣤⣤⣾⡿⠃⠀⠀⠀⠀⠀⠀⠘⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
           ⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
           ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
```

## Quick Start

```bash
bash mousterian-ux.sh
```

Choose your installation mode when prompted.

## Installation Modes

### 1. **Fresh Ubuntu Install** (requires sudo)
Complete desktop setup for a new Ubuntu machine with GNOME desktop.

**Installs:**
- Terminal tools: tmux, stow, tree (essentials)
- Bioinformatics libraries: build tools, imagemagick, SQLite, PostgreSQL client, Redis tools, etc.
- Desktop apps: Flatpak, VSCode, VLC, Inkscape, LibreOffice, Obsidian, Flameshot, LocalSend
- GNOME tweaks: custom hotkeys, theme, dock settings, extensions
- Mamba/Conda: Miniforge with bioconda and conda-forge channels
- Dotfiles: bash, git, VS Code, GNOME, ulauncher configs

**Use case:** New machine, full environment setup

### 2. **HPC User Environment** (no sudo required)
Lightweight setup for HPC clusters or shared systems where you lack root.

**Installs:**
- Mamba/Conda: Downloads and initializes Miniforge locally
- Mamba environments: `cli` env with wget, curl, stow, tree, tmux, git, pigz
- Dotfiles: Safe configs (bash, git only—no GNOME/desktop-specific stuff)

**Use case:** HPC login nodes, shared systems, or minimal installations

### 3. **Stow Dotfiles Only**
Symlink your dotfiles without installing anything. Choose:
- **Desktop setup**: All dotfiles (bash, git, VS Code, GNOME, ulauncher, GTK)
- **Core setup**: Safe-everywhere dotfiles (bash, git only)

**Use case:** Existing systems, re-deploying configs, testing dotfile changes

### 4. **Check System**
Verify OS, desktop environment, and sudo access without installing.

**Use case:** Verify compatibility before running installers

## What Gets Installed

### Terminal Stack
- `tmux` — terminal multiplexer
- `stow` — dotfile symlinker
- `tree`, `wget`, `curl`, `git`
- Build tools, libraries for development (clang, rustc, etc.)

### Desktop Apps (Fresh Install Only)
- **VS Code** — editor
- **Inkscape**, **LibreOffice**, **VLC** — creative & media
- **Obsidian** — note-taking
- **Flameshot** — screenshots
- **LocalSend** — file sharing
- **Flatpak** + flathub — app installer

### Bioinformatics Stack
- **Mamba/Conda** — package manager (uses bioconda + conda-forge)
- Development libraries: libssl, zlib, libyaml, imagemagick, mupdf, etc.
- Database clients: PostgreSQL, MySQL, SQLite, Redis tools
- Environments: `cli` (basic tools), `qc` (optional QC tools)

### Dotfiles Deployed
- `bash/` — bashrc, profile, aliases
- `git/` — gitconfig
- `vscode/` — editor settings & extensions
- `gtk/` — theme settings
- `ulauncher/` — app launcher config
- `autostart/` — GNOME autostart apps