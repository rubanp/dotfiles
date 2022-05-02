# Setup fzf
# =========
if [[ ! "$PATH" == */Users/ruban/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/ruban/.fzf/bin"
fi

# Auto-completion
# ===============
[[ $- == *i* ]] && source "/Users/ruban/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ============
source "/Users/ruban/.fzf/shell/key-bindings.zsh"

# Integrations
# ============

# Find in file using rga
fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    local file
    file="$(rga --max-count=1 --ignore-case --files-with-matches --no-messages "$*" | fzf-tmux +m --preview="rga --ignore-case --pretty --context 10 '"$*"' {}")" && echo "opening $file" && open "$file" || return 1;
}

# Find man pages
export MANPATH="/usr/share/man"
fman() {
    man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -r man
}

# Interactive cd
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
