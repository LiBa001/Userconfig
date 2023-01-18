#!/bin/bash

# install programs
sudo dnf install zsh kitty exa stow zoxide rclone go fzf bat ImageMagick
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)
sudo dnf copr enable varlad/helix && sudo dnf install helix
sudo dnf copr enable atim/bottom && sudo dnf install bottom

# install fonts
mkdir $HOME/.fonts
wget --directory-prefix=$HOME/.fonts \
	https://dtinth.github.io/comic-mono-font/ComicMono.ttf \
	https://dtinth.github.io/comic-mono-font/ComicMono-Bold.ttf

# stow config files
#cd $HOME
#git clone https://github.com/LiBa001/Userconfig
#cd Userconfig
stow */
#cd ..

# === INSIDE NEW ENVIRONMENT ===

# load config and setup paths
zsh
mkdir -p $USERBIN
mkdir -p $GOPATH

# install upspin via go
# (doing this after config has been loaded, to be able to access needed paths)
go install upspin.io/cmd/upspin@latest upspin.io/cmd/upspinfs@latest
ln -s $GOPATH/bin/upspin $USERBIN/
ln -s $GOPATH/bin/upspinfs $USERBIN/


# exit zsh to return to initial environment
exit

# === OUTSIDE NEW ENVIRONMENT ===

echo "===\nSetup finished.\n==="
echo "You may want to patch the 'Comic Mono' font family to have icons available. Please refer to the README.md (section 'Font Patching') for that."
