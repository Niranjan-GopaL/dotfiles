## Keybindings

[VSCode Too God stuff]
- Ctrl+Q := Select next same selection
  // NOTE : on pressing ctrl+Q YOU WILL BE IN `VISUAL MODE` 
  //        --> JUST PRESS `v` AND YOU WILL BE BACKE TO BE IN NORMAL MODE , 
  //        --> ( or press `I`) to go to insert mode DIRECTLY but most of the times you would wanna be in normal mode



- Search Editor => can you search and replace all the occurance of something across all files ; selectively changes some of them,etc
  (`shift+alt+f shift+alt+f`)
- Really powerful way to go through ANYTHING => `ctrl+shift+o` this will DISPLAY ALL OBJECTS IN VSC
- `gh` => will show whatever we see when we hover over that (DOCUMENTATION)


[VIM]
- using f to traverse in a line is insane;
- the reason why vim has % $ for bindings is because they ran out of keys ; everything was already bound to something ;
- I remapped 0 and $ to 1 and 2 ( since i rarelu use recursive vim stuff like 2j 2<C-a> etc )
- :viB select inside block
- 3ctrl + a => increases the number under cursor by 3   3 -> 6
- 3ctrl + x => decreases the number under curose by 3   3 -> 0 
- remapped start of line, end of line => 1,2
- HL to half a page up/down [Still need getting used to ]
- H and L are best ; if you wanna go up mindlessly? JK is the way
- BUT USE MARKERS
  ma     <- bookmarker on a
  `a     <- go to that bookmark
  :marks <- shows all the marks set
  :delmarks a s d f <- deletes all those book marks

[TMUX]
- [Temporarily hide all the panes in a window]
  this is a really nice keybinding in tmux 
  Press prefix+z => hat particular pane would be your only view until you press the keybinding again
- meta + h/l => tmux tab navigation
- prefix + z => hide panes
- prefix+ ctrl+hjkl => resize panes

- the only command you really need in vimium => `?`
- Ctrl + space is HOW TO ENVOKE INTELLISENSE suggestion while in the middle of the word
    - now you can traverse the intellisense using ctrl + j/k
- shift + alt + [ / ] = Folding / Unfolding


## Temporary To-do
- Tmux session need to persist


## In free time

### Urgent
- system_brightness
- Launch clipboard (rofi) how does it work


### Learn for fun
- how to customize waybar [PERSONLIZE]
- Learning Vimium ( use ? for bried description of keys )
- start using other aliases related to aur and arch repo
```sh
abbrev-alias ld='eza -lhD --icons=auto'   # long list dirs
abbrev-alias lt='eza --icons=auto --tree' # list folder as tree
abbrev-alias un='$aurhelper -Rns'         # uninstall package
abbrev-alias up='$aurhelper -Syu'         # update system/package/aur
abbrev-alias pl='$aurhelper -Qs'          # list installed package
abbrev-alias pa='$aurhelper -Ss'          # list availabe package
abbrev-alias pc='$aurhelper -Sc'          # remove unused cache
abbrev-alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
abbrev-alias vc='code' # gui code editor
```



## Completed

[DONE]
- Remap vim emulator keybindings (JK to move half a page up / down )
- navigate using ctrl j/k in command pallate / file picker [WORKED BEAUTIFULLY]
- bookmark extension explore ; reserve use of leader for marked lines management and naviagtion
- more useful tmux config ( easier to rename window ; start indexing from 1 ; )
- set up anki and sync it
- tmux config or zsh config [Only show the current parent directory]
- uninstall code oss install vs code ( would I loose the customisation ? )
- how to change font
- how to image view ( insided terminal perferably )
- how to wget an image from discord wallpaper section and add it the list of wallpapers in a theme
- how to minimise / move a view BACK
- installed nvChad
- how to change sddm themes 



## Learnt motions

- Sup + alt + S              --> move to special workspace
- Sup + shift + Ctrl + arrow --> move relative to curr workspace
- Sup + J                    --> Change orientation
- You can press `escape` twice, and it will append sudo to you're command 
- Cltr + 0 / 1 => switching between SIDEBAR and EDITOR FILE
- Sup + z / x                --> Resize the window SIMPLY BY USING MOUSE
    ( or rightClick / LeftClick )