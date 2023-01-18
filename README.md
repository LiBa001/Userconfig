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

### Fedora setup script
To quickly setup your system the way I have it, there is a [setup script](./setup_fedora.sh).
It installs basic programs (mostly the ones that this repo contains config files for), needed fonts and stows all the config files.

**The script is explicitly __not__ well tested and cannot be assumed to run safely. It's probably best used as a reference as to how I set up my system.**


## Font Patching
The font I use (Comic Mono) does not include icons by default, i.e. using tools like exa shows ugly placeholder boxes instead of icons.
To fix that, the font can be patched using the [NerdFonts](https://NerdFonts.com) [font patcher](https://github.com/ryanoasis/nerd-fonts#font-patcher).

To automate that, I wrote [a little script](./patch_fonts.sh) which assumes the font files to be in `$HOME/.fonts`.
The patched files will again be written to that directory (original files remain unchanged).

**The script will download and install the font patcher inside `/tmp` and delete it afterwards. __Usage of this script is at you own risk!__**

### Requirements
 - fontforge

### Example usage
Assuming you have the Comic Mono font files installed at `~/.fonts`, you can patch them using the script like this:
```bash
./patch_fonts.sh ComicMono.ttf ComicMono-Bold.ttf
```

##


*This repo and parts of the configuration are inspired by https://github.com/ChristianChiarulli/Machfiles .*
