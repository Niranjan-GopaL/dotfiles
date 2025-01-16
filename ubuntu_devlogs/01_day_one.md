
1. First things
- chrome,vscode install via .deb file from official website
`sudo dpkg -i ./google-chrome.deb`
- copied settings.json and keybindings.json
2. pulled devlogs
3. Configuring zsh, nerdfonts
4. Installing conda


# Pyenv

### Installation
- sudo apt udpate && sudo apt install -y tk-dev
- curl https://pyenv.run | zsh  
- add these lines to .zshrc
n=
```sh
# Load pyenv automatically
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Load pyenv-virtualenv automatically
eval "$(pyenv virtualenv-init -)"
```

### Important Commands 

```sh
$ pyenv versions # the astrisc indicates the globally selected python version, initially it'll be in system
$ pyenv install 3.10.9
$ pyenv global 3.10.9 # the astrisc will be now on 3.10.9
$ pyenv global system
$ pyenv local system
```

# How do apps work :-

I did `sudo make install` inside a repo called vantage

```sh
chmod +x ./install.sh
./install.sh 
Installing on Debian or derivative
Requirements are installed
cp ./icon.png /usr/share/icons/hicolor/scalable/apps/vantage.png
cp ./vantage.desktop /usr/share/applications/vantage.desktop
cp ./vantage.sh /usr/bin/vantage
chmod a+rx /usr/bin/vantage
```
# ZSH config

1. eza ( everything you need to install eza )
```sh
sudo apt update
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
```

2. Everything you need to install all important plugins 
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
Add this line in .zshrc ( search for plugins )
```sh
plugins=(
    git 
    # vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting # must be the last plugin sourced
)
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh
```

# All about fonts
```
sudo apt install fonts-font-awesome # nerd fonts
```