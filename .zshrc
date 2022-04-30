# Settings
# =========================================

export LANGUAGE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export VISUAL=nvim
export EDITOR=nvim
export PATH="$PATH:$HOME/.local/bin"

# Alias
# =========================================
source ~/.zsh_alias

# Plugins
# =========================================

# Vim Mode
source ~/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Auto Suggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Syntax Highlighting
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# FZF
source ~/.zsh/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh

# Keep Directory History
# =========================================
setopt AUTO_PUSHD                  # pushes the old directory onto the stack
setopt PUSHD_MINUS                 # exchange the meanings of '+' and '-'
setopt CDABLE_VARS                 # expand the expression (allows 'cd -2/tmp')
autoload -U compinit && compinit   # load + start completion
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

# Theme
# =========================================
source ~/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# FZF
# =========================================

# fzf
export FZF_DEFAULT_COMMAND="fd . --type f --hidden --follow --ignore-file ~/.fdignore"
export FZF_DEFAULT_OPTS='--multi --layout=reverse --height 100% --border'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :100 {}'"

export FZF_ALT_C_COMMAND="fd . --type d --ignore-file ~/.fdignore"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head  -100'"

bindkey "ç" fzf-cd-widget

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# LESS
# =========================================
export PAGER="less"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Centre Prompt
# =========================================

# load terminfo modules to make the associative array $terminfo available
zmodload zsh/terminfo 

# save current prompt to parameter PS1o
PS1o="$PS1"

# calculate how many lines one half of the terminal's height has
halfpage=$((LINES/2))

# construct parameter to go down/up $halfpage lines via termcap
halfpage_down=""
for i in {1..$halfpage}; do
  halfpage_down="$halfpage_down$terminfo[cud1]"
done

halfpage_up=""
for i in {1..$halfpage}; do
  halfpage_up="$halfpage_up$terminfo[cuu1]"
done

# define functions
function prompt_middle() {
  # print $halfpage_down
  PS1="%{${halfpage_down}${halfpage_up}%}$PS1o"
}

function prompt_restore() {
  PS1="$PS1o"
}

magic-enter () {
    if [[ -z $BUFFER ]]
    then
            print ${halfpage_down}${halfpage_up}$terminfo[cuu1]
            zle reset-prompt
    else
            zle accept-line
    fi
}
zle -N magic-enter
bindkey "^M" magic-enter

# Node Version Manager
# =========================================
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
