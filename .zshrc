autoload -Uz compinit
compinit
zmodload -a complist
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zshcache
__git_files () {
	_wanted files expl 'local files' _files
}
zstyle :compinstall filename '/Users/clever/.zshrc'

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

setopt no_beep
setopt extendedglob
#setopt print_exit_value
setopt prompt_subst
setopt complete_in_word
setopt no_auto_menu
setopt no_always_last_prompt
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt extended_history
setopt promptsubst
setopt autopushd
setopt pushdignoredups

autoload -U edit-command-line
zle -N edit-command-line
bindkey -e
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '\C-v' edit-command-line
bindkey '\Ea' push-line
local WORDCHARS=${WORDCHARS//\//}

autoload colors
colors
bright_cyan='%{[96m%}' # not provided by colors
PROMPT="%{${fg_bold[green]}%}%m%{${reset_color}%}:%{${fg_bold[blue]}%}%30<...<%~%<<%{${reset_color}%}%(!.#.\$) "
RPROMPT="%(?..%{$fg_bold[red]%}%? %{$reset_color%})" # exit status
RPROMPT+="%1(j.%{$fg[green]%}%j .)" # suspended jobs
autoload -Uz vcs_info
zstyle ':vcs_info:*' unstagedstr "%{$fg[red]%}*"
zstyle ':vcs_info:*' stagedstr "%{$fg[red]%}+"
zstyle ':vcs_info:*' formats "$bright_cyan%b%u%c"
zstyle ':vcs_info:*' actionformats "$bright_cyan%b%u%c|%a"
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'
zstyle ':vcs_info:bzr:*' use-simple true
zstyle ':vcs_info:*' enable git hg bzr svn cvs
precmd () { vcs_info }
RPROMPT+='${vcs_info_msg_0_}'
RPROMPT+="%{$reset_color%}"

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

export EDITOR=vim
export MANPAGER="/bin/sh -c \"col -bx | vim -c 'set ft=man' -\""
export GREP_COLORS='ms=01;36:mc=01;31:sl=:cx=:fn=35:ln=33:bn=33:se=01;34'

SSH_ENV="$HOME/.ssh/environment"
function start_agent {
    ssh-agent > "$SSH_ENV"
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" > /dev/null
    ssh-add
}
if [ -f "$SSH_ENV" ]; then
    . "$SSH_ENV" > /dev/null
fi
if [ -n "$SSH_AGENT_PID" ]; then
    ps ${SSH_AGENT_PID} > /dev/null
    if [ $? -ne 0 ]; then
        start_agent
    fi
else
    start_agent
fi

alias ls='ls -G -hv'
alias ll='ls -l'
alias l.='ls -Ad .*'
alias la='ls -A'
alias grep='grep --color -s'
alias df='df -hx tmpfs'
alias du='du --max-depth=1'
alias sr='screen -r'
alias mp='~/mplayer/mplayer/mplayer'
alias manmp='man -l ~/mplayer/mplayer/DOCS/man/en/mplayer.1'
alias mencoder='~/mplayer/mplayer/mencoder'
alias x264='~/x264/x264'
alias gil='TZ=America/Los_Angeles git log --graph --abbrev-commit --stat -C --decorate --date=local'
alias gib='git branch -a'
alias gis='git status'
alias gid='TZ=America/Los_Angeles git diff -C --date=local'
alias giw='TZ=America/Los_Angeles git show -C --date=local --decorate'
alias gic='git checkout'
alias gibl='TZ=America/Los_Angeles gil master..HEAD'
alias class='xprop -notype WM_CLASS'
alias tree='tree -AvL 10'
alias vil='vi *(.om[1])'
alias dt='gnome-terminal --hide-menubar'
alias sudovi='sudo vi -N -u /Users/clever/.vimrc'
function cl() {
	if [ $# = 0 ]; then
		cd && ls
	else
		cd "$*" && ls
	fi
}
function pdf() {
	evince "$*" &> /dev/null &!
}

export GOPATH=$HOME
export PYTHONSTARTUP=$HOME/.pystartup.py

VIRTUAL_ENV="/Users/clever/env"
#PATH=$VIRTUAL_ENV/bin:$PATH:/sbin:/usr/sbin
if [ -d $HOME/bin ]; then
	PATH=$HOME/bin:$PATH
fi

stty stop undef
