Import-Module PSReadLine

# Loading Theme and Shell :- All previes of themes are available in :- https://ohmyposh.dev/docs/themes
#  `$ Get-PoshThemes` execute this in pwsh to see all the installed themes
# MOdify this :- 'C:\Users\HP\AppData\Local\Programs\oh-my-posh\themes\tokyo.omp.json 


# GET CUSTOM POWERSHELL FONTS FROM => https://windowsterminalthemes.dev/ <-- EXTREMELY COOL ; I am using Argonaut now ; absolutely joyful


oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\tokyo.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\tokyonight_storm.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\if_tea.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\cert.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kushal.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\1_shell.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kali.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\json.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\hul10.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\huvix.omp.json" | Invoke-Expression


Function CD32 {Set-Location -Path D:\"Code Practise"}
Function nvim-configuration {Set-Location -Path C:\Users\HP\AppData\Local\nvim}
Function App-Dev {Set-Location -Path D:\"Code Practise"\"App Development"}
Function Next-Js-Dev {Set-Location -Path D:\"Code Practise"\\NextJS\bleeding_edge_travel_planner}
Function dot {Set-Location -Path D:\"Code Practise"\dotfiles}
Function openCVdir {Set-Location -Path D:\"Code Practise"\Exploring__Open_CV__}
Function Api-Dev {Set-Location -Path D:\"Code Practise"\API_Dev}
# Function gitadd {git add} we want something like abbrev-alias in fish ; ga should autocomplete to git add 
# OR take in inputs after ga 
Function gitstatus {git status}
Function gitlog {git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all}
Function npm-run-dev{npm run dev}
Function jupyterNotebook {jupyter notebook --notebook-dir=D:/"Code Practise"}


# Function to get the file size
Function Get-FileSize {
    Param(
        [String]$FilePath
    )

    # Get the file size
    [int]$Length = (Get-Item $FilePath).length

    # Format the file size based on size
    If ($Length -ge 1TB) {
        return "{0:N2} TB" -f ($Length / 1TB)
    }
    elseif ($Length -ge 1GB) {
        return "{0:N2} GB" -f ($Length / 1GB)
    }
    elseif ($Length -ge 1MB) {
        return "{0:N2} MB" -f ($Length / 1MB)
    }
    elseif ($Length -ge 1KB) {
        return "{0:N2} KB" -f ($Length / 1KB)
    }
    else {
        return "$($Length) bytes"
    }
}

# Function to list files and directories with their sizes
Function List-DirectoryContents {
    $items = Get-ChildItem -Force

    if ($items.Count -gt 0) {
        $items | ForEach-Object {
            if ($_.PSIsContainer) {
                $type = "Directory"
                $size = ""
            } else {
                $type = "File"
                $size = Get-FileSize -FilePath $_.FullName
            }

            [PSCustomObject]@{
                Mode          = $_.Mode
                LastWriteTime = $_.LastWriteTime
                Name          = $_.Name
                Type          = $type
                Size          = $size
            }
        } | Format-Table -AutoSize
    } else {
        Write-Host "No items found in the current directory."
    }
}



# Alias

# Path Aliases
Set-Alias -Name code-prac -Value CD32
Set-Alias -Name cv2-proj  -Value openCVdir
Set-Alias -Name devlog  -Value dot
Set-Alias -Name api  -Value Api-Dev
Set-Alias -Name app  -Value App-Dev
Set-Alias -Name next  -Value Next-Js-Dev
Set-Alias -Name vim-config  -Value nvim-configuration


# Commands
Set-Alias vim nvim
Set-Alias c   cls
Set-Alias gs  gitstatus 
# add git commit
Set-Alias g     gitlog
Set-Alias nrd   npm-run-dev
Set-Alias jn    jupyterNotebook 
Set-Alias grep  findstr   

# Set alias ll to the List-DirectoryContents function
Set-Alias l  List-DirectoryContents
