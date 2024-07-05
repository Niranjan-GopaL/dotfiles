# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Using fcitx for japanese IM
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'


# Path to powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh


# In case a command is not found, try to find the package that has it
# this was kinda slow
# function command_not_found_handler {
#     local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
#     printf 'zsh: command not found: %s\n' "$1"
#     local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
#     if (( ${#entries[@]} )) ; then
#         printf "${bright}$1${reset} may be found in the following packages:\n"
#         local pkg
#         for entry in "${entries[@]}" ; do
#             local fields=( ${(0)entry} )
#             if [[ "$pkg" != "${fields[2]}" ]] ; then
#                 printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
#             fi
#             printf '    /%s\n' "${fields[4]}"
#             pkg="${fields[2]}"
#         done
#     fi
#     return 127
# }
#
# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null ; then
            arch+=("${pkg}")
        else 
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}


# ---------------------------- abbrev-alias in zsh --------------------------------------------------------


# declare a list of expandable aliases to fill up later
typeset -a ealiases
ealiases=()

# write a function for adding an alias to the list mentioned above
function abbrev-alias() {
    alias $1
    ealiases+=(${1%%\=*})
}

# expand any aliases in the current line buffer
function expand-ealias() {
    if [[ $LBUFFER =~ "\<(${(j:|:)ealiases})\$" ]]; then
        zle _expand_alias
        zle expand-word
    fi
    zle magic-space
}
zle -N expand-ealias

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
abbrev-alias  e='exit'  # exit terminal

abbrev-alias  l='eza -lah  --icons=auto' # long list
abbrev-alias ls='eza -1   --icons=auto' # short list
abbrev-alias ll='eza -lah --icons=auto --sort=name --group-directories-first' # long list all
abbrev-alias ld='eza -lhD --icons=auto' # long list dirs
abbrev-alias lt='eza --icons=auto --tree' # list folder as tree



abbrev-alias un='$aurhelper -Rns' # uninstall package
abbrev-alias up='$aurhelper -Syu' # update system/package/aur
abbrev-alias pl='$aurhelper -Qs' # list installed package
abbrev-alias pa='$aurhelper -Ss' # list availabe package
abbrev-alias pc='$aurhelper -Sc' # remove unused cache
abbrev-alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
abbrev-alias vc='code' # gui code editor
abbrev-alias ueb='ueberzug'


# Handy change dir shortcuts
abbrev-alias ..='cd ..'
abbrev-alias ...='cd ../..'
abbrev-alias .3='cd ../../..'
abbrev-alias .4='cd ../../../..'
abbrev-alias .5='cd ../../../../..'

abbrev-alias czsh='nvim ~/.config/zsh/.zshrc'   
abbrev-alias czathura='nvim ~/.config/zathura/zathurarc'

abbrev-alias devlog='cd ~/Documents/code/dotfiles'
abbrev-alias devlog-code='code ~/Documents/code/dotfiles'

abbrev-alias gh-prof='cd ~/Documents/code/Niranjan-GopaL'
abbrev-alias gh-prof-code='code ~/Documents/code/Niranjan-GopaL'





# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbrev-alias mkdir=' mkdir -p'



# pokemon-colorscripts --no-title -r 1,3,6
abbrev-alias p='pokemon-colorscripts -r 1,3,6'
abbrev-alias t='tmux -u'
abbrev-alias r='ranger'
abbrev-alias f='fastfetch'
abbrev-alias b='btop --utf-force'


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

abbrev-alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
abbrev-alias glg2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"
abbrev-alias glg3="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)' "



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# echo "Sourcing ~/.config/zsh/.zshrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/niranjan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
