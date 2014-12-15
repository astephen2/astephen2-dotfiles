
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#Virtualenv
source /usr/local/bin/virtualenvwrapper.sh
export VIRTUAL_ENV_DISABLE_PROMPT=1

#Local files
if [ -r ~/.dotfiles/zsh/.zshrc.local ]; then
    . ~/.dotfiles/zsh/.zshrc.local
fi



