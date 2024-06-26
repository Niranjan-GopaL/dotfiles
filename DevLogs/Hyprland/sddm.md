## /usr/lib/sddm/sddm.conf.d/default.conf

Default configuration file for sddm is here

```sh
[Wayland]

# Path of the Wayland compositor to execute when starting the greeter
CompositorCommand=weston --shell=kiosk

# Enable Qt's automatic high-DPI scaling
EnableHiDPI=true

# Path to a script to execute when starting the desktop session
SessionCommand=/usr/share/sddm/scripts/wayland-session

# Comma-separated list of directories containing available Wayland sessions
SessionDir=/usr/local/share/wayland-sessions,/usr/share/wayland-sessions

# Path to the user session log file
SessionLogFile=.local/share/sddm/wayland-session.log


[X11]
# Path to a script to execute when starting the display server
DisplayCommand=/usr/share/sddm/scripts/Xsetup

# Path to a script to execute when stopping the display server
DisplayStopCommand=/usr/share/sddm/scripts/Xstop

# Enable Qt's automatic high-DPI scaling
EnableHiDPI=true

# Arguments passed to the X server invocation
ServerArguments=-nolisten tcp

# Path to X server binary
ServerPath=/usr/bin/X

# Path to a script to execute when starting the desktop session
SessionCommand=/usr/share/sddm/scripts/Xsession

# Comma-separated list of directories containing available X sessions
SessionDir=/usr/local/share/xsessions,/usr/share/xsessions

# Path to the user session log file
SessionLogFile=.local/share/sddm/xorg-session.log

# Path to Xephyr binary
XephyrPath=/usr/bin/Xephyr
```




## /usr/share/sddm/themes

this is where all the themes reside
