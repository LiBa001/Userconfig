#!/bin/bash

# This script expects positional arguments containing the font file names ( inside ~/.fonts ) that shall be patched.
# The patched font files are again written to "~/.fonts".

if [[ -z $1 ]]; then
 echo "No parameter passed. Need at least one font file to patch. Aborting."
 exit 1
fi

if ! command -v fontforge &> /dev/null; then 
 echo "Fontforge not installed. Aborting."
 exit 1
fi

# temporarily install "nerd fonts" font patcher
echo "installing font patcher . . ."
wget --directory-prefix=/tmp https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip
unzip -d /tmp/FontPatcher /tmp/FontPatcher.zip
rm /tmp/FontPatcher.zip
echo "installed."

# patch given fonts inside ~/.fonts directory
echo "patching fonts . . ."
for font in $@; do
 echo "patching: $font"
 fontforge -script /tmp/FontPatcher/font-patcher $HOME/.fonts/$font -out $HOME/.fonts/ \
  --fontawesome --fontawesomeextension --fontlogos --octicons --codicons --powersymbols --pomicons --powerline --powerlineextra --material --weather
done
echo "all patched."

# uninstall font patcher
echo "uninstalling font patcher . . ."
rm -r /tmp/FontPatcher
echo "uninstalled."

echo "finished."

