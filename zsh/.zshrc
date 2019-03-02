# Path to your oh-my-zsh installation.
  export ZSH=/home/la1/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

# User configuration

  export RANGER_LOAD_DEFAULT_RC="FALSE"
  export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
  export PATH=~/dotfiles/scripts/:$PATH
  export PATH="${PATH}:${HOME}/.local/bin/"
  export PATH="${PATH}:${HOME}/aur/imgur-screenshot/"
# export MANPATH="/usr/local/man:$MANPATH"

export ANDROID_HOME=/opt/android-sdk
#  export TERM="xterm-256color"

  setxkbmap -layout se

source $ZSH/oh-my-zsh.sh



if [[ -r /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
fi

export PATH=/opt/cuda/bin${PATH:+:${PATH}}
export CUDA_HOME=/opt/cuda${CUDA_HOME:+:${CUDA_HOME}}
export LD_LIBRARY_PATH=/opt/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=/opt/cuda/extras/CUPTI/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

if [[ $TERM == 'rxvt-unicode-256color' ]]; then

    # Import colorscheme from 'wal'
    # (wal -r &) # Old Wal
    ## Import colorscheme from 'wal' asynchronously
    # &   # Run the process in the background.
    # ( ) # Hide shell job control messages.
    (cat ~/.cache/wal/sequences &)

    # Alternative (blocks terminal for 0-3ms)
    # cat ~/.cache/wal/sequences

    # To add support for TTYs this line can be optionally added.
    source ~/.cache/wal/colors-tty.sh
fi


showerthoughts=$(curl -s --connect-timeout 5 -A '/u/DrDoctor13' \
'https://www.reddit.com/r/showerthoughts/top.json?sort=top&t=week&limit=100' | \
python2.7 -c 'import sys, random, json; randnum = random.randint(0,99); response = json.load(sys.stdin)["data"]["children"][randnum]["data"]; print "\n\"" + response["title"] + "\""; print "    -" + response["author"] + "\n";')
echo $showerthoughts | cowsay | lolcat

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


alias please='sudo'
alias kindly='sudo'
alias f='fzf --height 50% --border --preview "pygmentize -g -O style=monokai {}"'
alias vimf='vim $(fzf --height 50% --border --preview "pygmentize -g -O style=monokai {}")'

function ranger-run(){
    zle kill-whole-line
    BUFFER="ranger"
    zle accept-line
    zle reset-prompt
    # eval 'command ranger'
    # zle reset-prompt
}

zle      -N  ranger-run-widget ranger-run
bindkey '^E' ranger-run-widget

# Bind \eg to `git status`
function _git-status {
    zle kill-whole-line
    # zle -U "git status"
    BUFFER="git status"
    zle accept-line
}
zle -N _git-status
bindkey '\eg' _git-status

alias gs="git status"
alias gb="git branchs"
alias cdd="cd ~/dotfiles"
alias Control-F='vim $(fzf --height 50% --border --preview "pygmentize -g -O style=monokai {}")'

function f_widget {
    zle kill-whole-line
    # zle -U "git status"
    BUFFER='Control-F'
    zle accept-line
}
zle -N f_widget
bindkey '^F' f_widget
