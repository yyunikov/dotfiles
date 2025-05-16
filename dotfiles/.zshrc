if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.commonshellrc

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$PATH:$HOME/git/dotfiles/sh
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# No exit on ctrl+d
set -o ignoreeof

# hstr
export HISTFILE=~/.zsh_history
export HSTR_CONFIG=prompt-bottom,keywords-matching,raw-history-view
export HSTR_PROMPT="bck-i-search: "

bindkey -s "\C-r" "\eqhstr\n"

# gpg
export GPG_TTY=$(tty)

# direnv
eval "$(direnv hook zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Poetry
export PATH="$HOME/.local/bin:$PATH"

# rbenv
eval "$(rbenv init - zsh)"

export HISTSIZE=10000  # how many lines of history to keep in memory
export SAVEHIST=100000  # how many lines to keep in the history file

# colordiff
function diff {
     colordiff -u "$@" | less
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# docker shortcuts
drun() {
  export FZF_DEFAULT_OPTS='--height 90% --reverse --border'
  local image=$(docker images --format '{{.Repository}}:{{.Tag}}' | fzf-tmux --reverse --multi)
  if [[ $image != '' ]]; then
    echo -e "\n  \033[1mDocker image:\033[0m" $image
    read -e -p $'  \e[1mOptions: \e[0m' -i "-it --rm" options

    printf "  \033[1mChoose the command: \033[0m"
    local cmd=$(echo -e "/bin/bash\nsh" | fzf-tmux --reverse --multi)
    if [[ $cmd == '' ]]; then
        read -e -p $'  \e[1mCustom command: \e[0m' cmd
    fi
    echo -e "  \033[1mCommand: \033[0m" $cmd

    export FZF_DEFAULT_COMMAND='find ./ -type d -maxdepth 1 -exec basename {} \;'
    printf "  \033[1mChoose the volume: \033[0m"
    local volume=$(fzf-tmux --reverse --multi)
    local curDir=${PWD##*/}
    if [[ $volume == '.' ]]; then
        echo -e "  \033[1mVolume: \033[0m" $volume
        volume="`pwd`:/$curDir -w /$curDir"
    else
        echo -e "  \033[1mVolume: \033[0m" $volume
        volume="`pwd`/$volume:/$volume -w /$volume"
    fi

    export FZF_DEFAULT_COMMAND=""
    export FZF_DEFAULT_OPTS=""

    history -s runc
    history -s docker run $options -v $volume $image $cmd
    echo ''
    docker run $options -v $volume $image $cmd
  fi
}

dgrep() {
   docker ps | grep "$1"
}

dlog() {
  docker ps  | sed '1d'| fzf -m --preview-window=down:50% --preview="docker logs {1}" | awk '{print $1}' | xargs docker logs
}

dkill() {
  docker ps | sed '1d' | fzf -m --preview-window=down:50% --preview="docker logs {1}" | awk '{print $1}' | xargs docker kill
}

dlogf() {
  docker ps | sed '1d' | fzf -m --preview-window=down:50% --preview="docker logs {1}" | awk '{print $1}' | xargs docker logs -f
}

dlogaf() {
  docker ps -a | sed  '1d' | fzf -m --preview-window=down:50% --preview="docker logs {1}" | awk '{print $1}' | xargs docker logs
}

dexec() {
	container_id=$(docker ps | sed '1d' | fzf -m --preview-window=down:50% --preview="docker logs {1}" | awk '{print $1}')
	 docker exec -it $container_id sh
}

# Bash My AWS
export PATH="$PATH:$HOME/.bash-my-aws/bin"
source ~/.bash-my-aws/aliases
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/.bash-my-aws/bash_completion.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
