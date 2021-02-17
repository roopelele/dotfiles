# Path to your oh-my-zsh installation.
export ZSH="/home/roope/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="risto"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yy/mm/dd"

plugins=(
    git
    python
)

source $ZSH/oh-my-zsh.sh

# User configuguration

alias bpytop="/home/roope/.local/bin/bpytop"
alias ping="ping -c 4"
alias python="python3"
alias pip="pip3"
alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"

neofetch
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/roope/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/roope/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/roope/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/roope/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
