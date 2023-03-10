#!/bin/sh
#alias j='z'
#alias f='zi'
#alias g='lazygit'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
#alias nvimrc='nvim ~/.config/nvim/'
#alias yay="paru"

# alias lvim='nvim -u ~/.local/share/lunarvim/lvim/init.lua --cmd "set runtimepath+=~/.local/share/lunarvim/lvim"'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# gpg encryption
# verify signature for isos
#alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
#alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# systemd
#alias mach_list_systemctl="systemctl list-unit-files --state=enabled"

#alias mach_java_mode="export SDKMAN_DIR="$HOME/.sdkman" && [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh""

#alias m="git checkout master"
#alias s="git checkout stable"

# kitty kittens
if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"   # ssh wrapper for remote shell integration with kitty
	alias icat="kitty +kitten icat" # display images in terminal
fi

# use bat to colorize cat and man (for theming see BAT_THEME in exports config)
if command -v bat &> /dev/null; then
  alias cat="bat -pp"  # plain output with only highlighting
  alias catt="bat"     # stylized output with paging
  
	function batman() {
		/bin/man $@ | bat -p -l man  # display manpage with highlighting
	}
	alias man=batman
fi

# upspin
UPSPIN_CONFIG="$HOME/.config/upspin/config.yml"
alias upspin="upspin -config=$UPSPIN_CONFIG"
alias upspinfs="upspinfs -config=$UPSPIN_CONFIG"


# OS specific
case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
	alias ls='ls -G'
	;;

Linux)
	alias ls='ls --color=auto'
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac
