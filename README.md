# Dotfiles

## Installation

### First Steps: Clone Repository

```bash
cd ~ && git clone git@github.com:thedustin/dotfiles.git
```

### Dotfiles

```bash
cd ~ && ln -s dotfiles/.{aliases,bash_profile,bash_prompt,bashrc,dircolors,exports,functions,inputrc} .
```

### Visual Studio Code

Just create a symlink to the `settings.json`:

```bash
cd ~/Library/Application\ Support/Code/User && ln -s ~/dotfiles/vscode/settings.json
```

### Create global `.gitignore`

My global `.gitignore` file for common non-versioned files like macOS `.DS_Store` and so on.

```bash
mkdir -p ~/.git_core/
touch ~/.git_core/.gitignore
git config --global core.excludesfile ~/.git_core/.gitignore

# Optional: copy template/base
cd ~/dotfiles/git/ && cp ./.gitignore.dist ~/.git_core/.gitignore
```

### Setup git aliases

```bash
# List all existing aliases
git config --global --get-regex ^alias\.

# Create our aliases
git config --global alias.stauts status
git config --global alias.dff diff
git config --global alias.pul pull
```

### Setup git differ

```bash
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
```

### Terminal Theme

My favorite terminal theme ist [Smyck](https://github.com/hukl/Smyck-Color-Scheme) (this way I don‘t need to search for it again and again…)
