# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# initializing conda in your current shell session
# eval "$(/home/nira/miniconda3/bin/conda shell.zsh hook)"


# CUDA 12.9 paths
export PATH="/usr/local/cuda-12.9/bin${PATH:+:${PATH}}"
export LD_LIBRARY_PATH="/usr/local/cuda-12.9/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git 
    # vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting # must be the last plugin sourced
)
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='vim'
# fi


INSERT_MODE_INDICATOR="%F{yellow}+%f"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ---------------------------- abbrev-alias in zsh ------------------------------------------------------------- 


# declare a list of expandable aliases to fill up later
typeset -a ealiases
ealiases=()

# write a function for adding an alias to the list mentioned above
function abbrev-alias() {
    alias $1
    ealiases+=(${1%%\=*})
}

# expand any aliases in the current line buffer
# function expand-ealias() {
#     if [[ $LBUFFER =~ "\<(${(j:|:)ealiases})\$" ]]; then
#         zle _expand_alias
#         zle expand-word
#     fi
#     zle magic-space
# }

# Use this to print out things when you wanna debug abbrev-alias
# function expand-ealias() {
#     echo "LBUFFER: $LBUFFER"
#     echo "ealiases: ${(j:|:)ealiases}"
#     if [[ $LBUFFER =~ "\<(${(j:|:)ealiases})\$" ]]; then
#         echo "Match found!"
#         zle _expand_alias
#         zle expand-word
#     fi
#     zle magic-space
# }

# For some reason vr and lab (normal alias) was being added to elias array that are abbrev-alias commands
function expand-ealias() {
    if [[ $LBUFFER =~ "\<(${(j:|:)ealiases})\$" && ! $LBUFFER =~ "(cv|lab|doc)$" ]]; then
        zle _expand_alias
        zle expand-word
    fi
    zle magic-space
}

zle -N expand-ealias
# It registers your expand-ealias function as a new ZLE (Zsh Line Editor) widget. 
# Without this line, you wouldn't be able to bind the function to a key (like the space key in your case).


# Bind the space key to the expand-alias function above, so that space will expand any expandable aliases
bindkey ' '        expand-ealias
bindkey '^ '       magic-space              # control-space to bypass completion
bindkey -M isearch " "      magic-space     # normal space during searches

# A function for expanding any aliases before accepting the line as is and executing the entered command
expand-alias-and-accept-line() {
    expand-ealias
    zle .backward-delete-char
    zle .accept-line
}
zle -N accept-line expand-alias-and-accept-line




# Helpful aliases
abbrev-alias  c='clear' # clear terminal
abbrev-alias  e='exit'  # exit
abbrev-alias ls='eza -1  --git --icons=auto' # short list
abbrev-alias  l='eza -lah --git --icons=auto' # long list
abbrev-alias ll='eza -lha --icons=auto --sort=name  --sort=modified --group-directories-first' # long list all
abbrev-alias lld='eza -lhD --icons=auto' # long list dirs
# abbrev-alias la='eza -lha --icons=auto .[!.]*' # list only hidden files, it recursievly
abbrev-alias la='eza -lha --icons=auto | grep "^\."' # list only hidden files

abbrev-alias lt='eza --icons=auto --tree' # list folder as tree
abbrev-alias lr='eza -lha --icons=auto --recurse' # recursive listing of all files





# Handy change dir shortcuts
abbrev-alias ..='cd ..'
abbrev-alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
abbrev-alias czsh='code ~/.zshrc' 
abbrev-alias ckitty='code ~/.config/kitty/kitty.conf'
abbrev-alias ctmux='code /home/nira/.config/tmux/tmux.conf'
abbrev-alias vivado='sudo /tools/Xilinx/Vivado/2024.2/bin/vivado'


# Custom paths, these are better as alias


alias fonts='cd /home/nira/.local/share/fonts'
alias sysfonts='/usr/share/fonts'

alias mult='cd /home/nira/Documents/code/ece/Emerging_Multiplier_Architectures'
alias devlog='cd /home/nira/Documents/code/dotfiles/ubuntu_devlogs'
alias aiml='cd /home/nira/Documents/code/aiml'
alias cv="cd /home/nira/Documents/code/aiml/Exploring_Open_CV"
alias lab="cd /home/nira/Documents/code"
alias moml='cd /home/nira/Documents/code/aiml/MultiObjective_Machine_Learning'
alias nova='cd /home/nira/Documents/code/processors/NovaCore'
alias ece='cd /home/nira/Documents/code/ece'
alias rtl='cd /home/nira/Documents/code/ece/rtl '
alias proc='cd /home/nira/Documents/code/processors'
alias downloads='cd /home/nira/Downloads'
alias doc='cd /home/nira/Documents'
alias work='cd /home/nira/Documents/code'
alias dsa='cd /home/nira/Documents/code/swe/Algorithm-Toolkits'
alias swe= 'cd /home/nira/Documents/code/swe'



# Sync dotsfile change wil repo
abbrev-alias mvzsh='cp ~/.zshrc'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'
alias n='nvim'
abbrev-alias p='python3 '
abbrev-alias g='git '
abbrev-alias gc='git commit -m "'
abbrev-alias ga='git add '
abbrev-alias gac='git add . && git commit -m " '
abbrev-alias gcp='function _gcp() { git add . && git commit -m "$1" && git push; }; _gcp'
abbrev-alias gcA='function _gcA() { git add "$1"  && git commit -m "$2" ; }; _gcA'
abbrev-alias gp="git push"
abbrev-alias gs="git status -s"
abbrev-alias gl="git log --oneline"

abbrev-alias lo="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
 

abbrev-alias nrd="npm run dev"
abbrev-alias  yd="yarn dev"
abbrev-alias ni="npm i"
abbrev-alias nest="npx expo start --tunnel"

abbrev-alias rc=rustc
abbrev-alias ca=cargo
abbrev-alias p=python3
abbrev-alias s=sudo
# This will ensure the service start automatically the next time the system boots up
abbrev-alias sctle='sudo systemctl enable'
abbrev-alias sctls='sudo systemctl start'
abbrev-alias sctlstat='sudo systemctl status'
abbrev-alias sa='sudo apt'
abbrev-alias sai='sudo apt install'
abbrev-alias sui='sudo apt update && sudo apt install '
alias szsh='source ~/.config/zsh/.zshrc'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/usr/local/bin/ngrok 
export PATH="/opt/riscv32/bin:$PATH"
export PATH="$HOME/.local/kitty.app/bin:$PATH"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nira/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nira/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/nira/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/nira/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
