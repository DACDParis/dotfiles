# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
# We check for the specific directory to avoid double-adding it
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    PATH="$HOME/bin:$PATH"
fi

export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Enable bash completion in interactive shells
## User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

. "$HOME/.cargo/env"

eval "$(zoxide init bash)"
eval "$(fzf --bash)"

#export EDITOR="emacsclient -t -a ''"
#export VISUAL="emacsclient -c -a ''"

export PATH="/$HOME/.config/emacs/bin:$PATH"

export EDITOR="code"
export VISUAL="code"

alias install="sudo dnf install"
alias search="sudo dnf search"
alias update="sudo dnf update"
alias remove="sudo dnf remove"
alias zik="ncmpcpp -c PATH=~/.config/ncmpcpp/config"
alias l="eza -lah --icons"
alias ls="eza -lah --icons"
alias ll="eza -lah --icons"
alias la="eza -lah --icons"
alias g="z"
alias cat="bat"
alias ytd="yt-dlp"
alias ed="EDITOR"
alias zel="zellij"
alias fzf="fzf --preview 'bat --color=always {}'"
alias net="vnstati -s -i wlp6s0 -o ~/Downloads/summary.png"

## Removes spaces from all file names
alias remscpace="for f in *\ *; do mv "$f" "${f// /_}"; done"

# Extracts any archive(s) (if unp isn't installed)
ex () {
	for archive in "$@"; do
		if [ -f "$archive" ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf "$archive"    ;;
				*.tar.gz)    tar xvzf "$archive"    ;;
				*.bz2)       bunzip2 "$archive"     ;;
				*.rar)       unrar x "$archive"       ;;
				*.gz)        gunzip "$archive"      ;;
				*.tar)       tar xvf "$archive"     ;;
				*.tbz2)      tar xvjf "$archive"    ;;
				*.tgz)       tar xvzf "$archive"    ;;
				*.zip)       unzip "$archive"       ;;
				*.Z)         uncompress "$archive"  ;;
				*.7z)        7z x "$archive"      ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

PS1='\n \[\e[38;5;27m\]\u \[\e[38;5;249m\]\w \[\e[32m\]$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)\n \[\e[38;5;27m\]  \[\e[38;5;27m\]> \[\e[0m\]'


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}