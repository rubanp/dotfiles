# Settings
# =========================================

export LANGUAGE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export VISUAL=nvim
export EDITOR=nvim
export PATH="$PATH:$HOME/.local/bin:$HOME/dotfiles/bin"
export THEME='gruvbox'
export BACKGROUND='#282828'

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

# FZF Marks
source ~/.zsh/plugins/fzf-marks/fzf-marks.plugin.zsh 
export FZF_MARKS_COMMAND="fzf --height 100% --reverse"

# Keep Directory History
# =========================================
setopt AUTO_PUSHD                  # pushes the old directory onto the stack
setopt PUSHD_MINUS                 # exchange the meanings of '+' and '-'
setopt CDABLE_VARS                 # expand the expression (allows 'cd -2/tmp')
autoload -U compinit && compinit   # load + start completion
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

# Keyboard Shortcuts
# =========================================
bindkey -s '^e' 'editfile^M' # Open file in vim through fzf
bindkey -s '^o' 'openfile^M' # Open file in default program through fzf
bindkey -s '^g' 'fzm^M' # Go to bookmarked directory through fzf
bindkey -s '^z' 'source ~/.zshrc^M' # Source .zshrc
bindkey -s '^k' 'tfz^M' # Attach to tmux session through fzf
bindkey -s '^f' 'ranger^M' # Open ranger

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

fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    local file
    file="$(rga --max-count=1 --ignore-case --files-with-matches --no-messages "$*" | fzf-tmux +m --preview="rga --ignore-case --pretty --context 10 '"$*"' {}")" && echo "opening $file" && open "$file" || return 1;
}

function cd() {
    if [[ "$#" != 0 ]]; then
        builtin cd "$@";
        return
    fi
    while true; do
        local lsd=$(echo ".." && ls -ap | grep '/$' | sed 's;/$;;')
        local dir="$(printf '%s\n' "${lsd[@]}" |
            fzf --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -ap --color=always "${__cd_path}";
        ')"
        [[ ${#dir} != 0 ]] || return 0
        builtin cd "$dir" &> /dev/null
    done
}

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

# Node Version Manager
# =========================================
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
