fpath+=~/.zfunc

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt notify

zstyle :compinstall filename '/home/david/.zshrc'

autoload -Uz compinit

ZSH_COMPDUMP=${ZSH_COMPDUMP:-${ZDOTDIR:-~}/.zcompdump}

# cache .zcompdump for about a day
if [[ $ZSH_COMPDUMP(#qNmh-20) ]]; then
  compinit -C -d "$ZSH_COMPDUMP"
else
  compinit -i -d "$ZSH_COMPDUMP"; touch "$ZSH_COMPDUMP"
fi
{
  # compile .zcompdump
  if [[ -s "$ZSH_COMPDUMP" && (! -s "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc") ]]; then
    zcompile "$ZSH_COMPDUMP"
  fi
} &!

compinit
# End of lines added by compinstall
#
export PATH="$HOME/bin:$PATH"

#PS1='\n \[\e[38;5;27m\]\u \[\e[38;5;249m\]\w \[\e[32m\]$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)\n \[\e[38;5;27m\]  \[\e[38;5;27m\]> \[\e[0m\]'

export PATH="$HOME/.npm-global/bin:$PATH"
export PATH=”/home/david/.cargo/bin:$PATH”
export GOPATH=$HOME/go
PATH="/$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/$HOME/perl5"; export PERL_MM_OPT;


export PATH="/$HOME/scripts:$PATH"
export PATH="/$HOME/.config/emacs/bin:$PATH"
export EDITOR="/$HOME/.local/bin/lvim"
alias lv="/home/david/.local/bin/lvim"
alias slv="sudo /home/david/.local/bin/lvim"
alias lvzsh="/home/david/.local/bin/lvim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias install="sudo dnf5 install"
alias search="sudo dnf5 search"
alias update="sudo dnf5 update"
alias remove="sudo dnf5 remove"
alias zik="ncmpcpp -c PATH=~/.config/ncmpcpp/config"
alias l="ls -lah"
alias ll="ls -lah"
alias g="z"
alias fm="yazi"
alias cat="bat"
alias pdf="nohup $HOME/Applications/Sioyek/sioyek > /dev/null 2>&1 &"
alias -s {txt,conf,md}=/$HOME/.local/bin/lvim

# Extracts any archive(s) (if unp isn't installed)
ex () {
	for archive in "$@"; do
		if [ -f "$archive" ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       unrar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

eval "$(zoxide init bash)"
eval $(thefuck --alias fck)
eval "$(starship init zsh)"

export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"

#ZSH Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Yazi Shell wrapper of Bash / Zsh
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
