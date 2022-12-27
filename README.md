# Userconfig
These are my Linux user configuration files (dotfiles).

## Installation
The best way to add the files to your own system is using [GNU Stow](https://www.gnu.org/software/stow/).

1. Clone the repo into your user home directory:
```bash
cd ~
git clone https://github.com/LiBa001/Userconfig
cd Userconfig
```

2. Use `stow` to symlink the config files:
```bash
stow */
```
The above command stows the contents of every directory in the repo.
You can also stow specific directories. For example, to only add the config for ZSH:
```bash
stow zsh
```

##


*This repo and parts of the configuration are inspired by https://github.com/ChristianChiarulli/Machfiles .*
