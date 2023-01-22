#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY_TIME # Write to the history file immediately (not when the shell exits), but don't import immediately (as opposed to SHARE_HISTORY)

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/minimaliba.zsh-theme"  # set custom prompt

# plugins
plug "zsh-users/zsh-autosuggestions"
#plug "hlissner/zsh-autopair"  # auto-closes, deletes and skips over matching delimiters in zsh intelligently
plug "zap-zsh/supercharge"
#plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"

# keybinds
bindkey '^ ' autosuggest-accept

# plugin config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=15"
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

# run init scripts
#eval "$(fnm env)"
eval "$(zoxide init zsh)"  # initialize zoxide for zsh
# eval "`pip completion --zsh`"

if [[ $TERM == "xterm-kitty" ]]; then
  export KITTY_SHELL_INTEGRATION="enabled"
  autoload -Uz -- /usr/lib64/kitty/shell-integration/zsh/kitty-integration; kitty-integration; unfunction kitty-integration
fi

