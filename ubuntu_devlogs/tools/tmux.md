
MOST IMPORTANT SHORTCUT
> prefix + ? => All shortcuts you are using 
prefix + w ( just like prefix + s but better )


# Copy Mode
 prefix + [ --> enter tmux copy mode ;
 THIS IS SOOO COOL => you can look into tmux paste buffer using `prefix + =`

```sh
# remember to install `xclip` for some reason it integerated everything nicely
# Use Vim-style keybindings in copy mode
setw -g mode-keys vi
bind-key -T copy-mode-vi 'v' send-keys -X begin-selection
bind -T copy-mode-vi 'y' send-keys -X copy-pipe-and-cancel "xclip -i -f -selection primary | xclip -i -selection clipboard"
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -i -f -selection primary | xclip -i -selection clipboard"
```