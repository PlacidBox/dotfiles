export LANG="en_AU.UTF-8"

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' format '%d:'
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' original true
zstyle ':completion:*' verbose true

autoload -Uz compinit
compinit

unsetopt list_beep

setopt bash_auto_list
unsetopt auto_menu
setopt dvorak

setopt append_history
setopt hist_expire_dups_first
setopt share_history
setopt extended_history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000

bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export PATH=$HOME/bin:$HOME/dotfiles/bin:$PATH

alias ls='ls --color=auto'
alias ll='ls -la'

POWERLEVEL9K_INSTALLATION_PATH=~/dotfiles/zsh
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs dir_writable status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs virtualenv command_execution_time)

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='240'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='007'

POWERLEVEL9K_DIR_HOME_BACKGROUND='238'
POWERLEVEL9K_DIR_HOME_FOREGROUND='007'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='238'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='007'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='065'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='007'

POWERLEVEL9K_OK_ICON='%%'
POWERLEVEL9K_STATUS_OK_BACKGROUND='236'
POWERLEVEL9K_STATUS_OK_FOREGROUND='007'

POWERLEVEL9K_EXECUTION_TIME_ICON=''

DEFAULT_USER=`whoami`

source ~/dotfiles/zsh/powerlevel9k.zsh-theme
