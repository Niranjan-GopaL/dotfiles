## IME / IMF ( Input methode framework , engine )

- IMF sits between the IME and Application


#### Installing an IMF 

- fcitx5 is a IMF ( one of the better ones that wayland supports)
- use either fcitx5 or fcitx


```sh
# fcitx5-gtk fcitx5-qt <-- plugins to make it work in gtk application.
sudo pacman -S fcitx5-im fcitx5-configtool fcitx5-gtk fcitx5-qt

# old is gold too
sudo pacman -S fcitx-im fcitx-configtool

```

### Downloading an Engine for the language

- for Japanese => mozc ( based on google's translatation ; feature-filled )
- for French, German, Russian => their respective engines are given in the wiki

```sh
sudo pacman -S fcitx5-[ENGINE_NAME]

sudo pacman -S fcitx5-mozc 

# if you are using fcitx
sudo pacman -S fcitx-mozc 

```

### Set Environment variables

Even if you are using fcitx or fcitx5 these are the same 

In you're zshrc :-
```zsh
# Using fcitx for japanese IM
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
```

### Setting the locale for the languages

`sudo vim /etc/locale.gen`
uncomment ja_JP.UTF-8.line 
`sudo locale-gen`


### Run on startup ; Add it to hyprland.conf

> # starting fcitx5
> exec-once = fcitx

=>  Now you can access this from system tray OR USING THE `fcitx-configtool` !


## Hyprland Wiki is really good !

- Swaps ctrl with caps

```s
input{
    kb_options = ctrl:swapcaps
}
```

## Clipboard

[ISSUES]
- `sudo nvim` does not copy stuff to system clipboard


- See the keybindings.conf
- cliphist is the cliboard manager ; How to use it ? ASK IN **DISCORD**