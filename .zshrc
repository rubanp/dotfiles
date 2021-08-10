source /Users/ruban/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

source ~/.zsh_alias
source ~/.zsh_alias_private

export LANGUAGE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export VISUAL=vim
export EDITOR=vim

export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"

export PATH="/Users/ruban/Dotfiles/private-dotfiles/scripts:$PATH"

POWERLEVEL9K_LEGACY_ICON_SPACING=true

# Plugins

# Vim Mode
source ~/.oh-my-zsh/custom/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh

# Auto Suggestions
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highlighting
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Directory History
setopt AUTO_PUSHD                  # pushes the old directory onto the stack
setopt PUSHD_MINUS                 # exchange the meanings of '+' and '-'
setopt CDABLE_VARS                 # expand the expression (allows 'cd -2/tmp')
autoload -U compinit && compinit   # load + start completion
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf
export FZF_DEFAULT_COMMAND="fd . --type f --hidden --follow --ignore-file ~/.config/fd/ignore/.fdignore"
export FZF_DEFAULT_OPTS='--multi --layout=reverse --height 100% --border'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :100 {}'"

export FZF_ALT_C_COMMAND="fd . --type d"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head  -100'"

bindkey "ç" fzf-cd-widget

# Make most default pager
export PAGER="less"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# zsh centre prompt on screen automatically
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

_fix_cursor() {
    echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)
