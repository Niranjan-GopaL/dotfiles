Import-Module PSReadLine

# Loading Theme and Shell :- All previes of themes are available in :- https://ohmyposh.dev/docs/themes
 
  oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kushal.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kali.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\json.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\hul10.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\huvix.omp.json" | Invoke-Expression


Function CD32 {Set-Location -Path D:\"Code Practise"}
Function dot {Set-Location -Path D:\"Code Practise"\dotfiles}
Function openCVdir {Set-Location -Path D:\"Code Practise"\__Exploring_Deep_Learning}
# Function gitadd {git add} we want something like abbrev-alias in fish ; ga should autocomplete to git add 
# OR take in inputs after ga 
Function gitstatus {git status}
Function gitlog {git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all}

Function jupyterNotebook {jupyter notebook --notebook-dir=D:/"Code Practise"}


# Alias

# Path Aliases
Set-Alias -Name code-prac -Value CD32
Set-Alias -Name cv2-proj  -Value openCVdir
Set-Alias -Name devlog  -Value dot


# Commands
Set-Alias vim nvim
Set-Alias l   ls
Set-Alias c   cls
Set-Alias g   git
Set-Alias gs  gitstatus 
# add git commit
Set-Alias gg  gitlog
Set-Alias jn    jupyterNotebook 
Set-Alias grep findstr   
