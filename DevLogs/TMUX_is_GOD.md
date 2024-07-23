## T-mux 

[Solved use `tmux -u`]
> Currently, there seems to be issues downloading plugins and cant' get NerdFonts work inside TMUX, BUT kitty out of the box has support for TABS and PANES ; These are the functionalities that I need right now, in the future sessions would com more in handy 


TMUX COPY MODE IS LIKE NTERMINAL IN NEOVIM ; IT'S INSANLY USEFULLL !!


```sh
$ sudo ln -s /usr/local/bin/tmux /usr/bin/tmux
```



### Copy Mode






![TMUX Cheatsheet](./../assets/tmux_cheatsheet.png)

> MAN PAGE IS SOO COOL


#### Config file 

There is a plugin manager called `tpm`, sought of like `Lazy` for neovim

```sh
# now you can resize panes using panes  ( ctrl jkhl is wayy more natural )
set -g mouse on

```


#### Keybindings

- Status bar is soo fricking cool `shows all the window you have running`

- leader => Ctrl + a

leader + 
- [       => Copy mode
- i       => installs all the plugins 
- c       => new window
- [0-9]   => cycle through opened window
- n       => next window in cycle


- x        => close current pane ( you can just type `exit` in terminal in that pane  )
- q        => see the index of each pane
- arrow    => navigate between split
- t        => time view

-  d => detach from tmux session
- `tmux ls`     => ALL SESSIONS you have opened 
- `tmux attach` => attaches back last detached session
- `tmux session`=> creates a new session

- meta + h/l    => tmux tab navigation
- prefix + z    => Focuses on that pane
- prefix+ ctrl+hjkl => resize panes

- From inside a tmux session, go to another tmux session := `leader + s` ( list sessions inside tmux)

> leader + : => command MODE

- :rename-window node-server
- :rename-session next-js-learning-session
- :kill-window



#### tldr benefits :-   
- PRODUCTIVITY *no more opening many terminals, JUST ONE TO DO IT ALL !!*
- persistance *you can jump back into the same setup*
- session sharing *you can share you're FUCKING SESSION, pair programming lol*

#### Info from man page
- tmux may be detached from a  screen  and  continue running in the background, then later reattached
- When tmux is started, it creates a new session with a single window and displays it on screen.
- A session is a single collection of pseudo terminals under the management of tmux.
- Once all sessions are killed, tmux exits.
- A session is displayed on screen by a client and all sessions are managed by a single server.
- By default, tmux loads the system configuration file from  /etc/tmux.conf,  if  present,  then  looks for  a  user  configuration file  at ~/.tmux.conf, $XDG_CONFIG_HOME/tmux/tmux.conf or ~/.tmux.conf.
- By default, tmux loads the system configuration file from  /etc/tmux.conf,  if  present,  then  looks  for  a  user  configuration  file  at ~/.tmux.conf, $XDG_CONFIG_HOME/tmux/tmux.conf or ~/.tmux.conf.