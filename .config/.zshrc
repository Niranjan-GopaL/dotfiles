# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Path to powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

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
abbrev-alias  l='eza -lh  --icons=auto' # long list
abbrev-alias ls='eza -1   --icons=auto' # short list
abbrev-alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
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
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
abbrev-alias devlog='code ~/Documents/dotfiles'
abbrev-alias czsh='nvim ~/.config/zsh/.zshrc'   

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'




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



# THIS FRIKKIN WORKS
#
# Compare .zshrc with the version in ~/Documents/dotfiles/.config/.zshrc
if ! cmp -s ~/.zshrc ~/Documents/dotfiles/.config/.zshrc; then
    echo "Changes in .zshrc are gonna be pushed" 
    # Change to the dotfiles directory
    cd ~/Documents/dotfiles
    # Push the changes to the remote repository, this will trigger a HOOK
    git push 
fi



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Display Pokemon
pokemon-colorscripts --no-title -r 1,3,6

echo "Sourcing ~/.config/zsh/.zshrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
