# Dotfiles

## Installation

### First Steps: Clone Repository

```bash
cd ~
git clone git@github.com:thedustin/dotfiles.git
```

### Dotfiles

```bash
cd ~
ln -s dotfiles/.* .
```

### Visual Studio Code

Just create a symlink to the `settings.json`:

```bash
cd ~/Library/Application\ Support/Code/User
ln -s ~/dotfiles/vscode/settings.json
```
