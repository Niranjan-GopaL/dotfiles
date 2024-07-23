## General facts

- When you install a font using `pacman`, it's stored in `/usr/share/fonts`
    - `pacman -S noto-fonts-cjk` => makes a `/usr/share/fonts/noto-cjk` folder noto-cjk is chinese japanese korean Glyphs
- You shouldn't use a terminal to start a gui application
- `ff -> fastfetch`          <-- show device stats
- ` pokemon-colorscripts -r` <-- makes my heart melt
- You can press `escape` twice, and it will append sudo to you're command 
- or run `sudo !!` <- to run last command with sudo
- Change you're host name (computer name)
```sh
sudo nvim /etc/hostname # replace the name here
sudo nvim /etc/hosts    # Replace any occurrence of the existing computer name with your new one
```

## Kitty

- New tab      ctrl+shift+t (also ⌘+t on macOS)
- Close tab    ctrl+shift+q (also ⌘+w on macOS)
- Next tab     ctrl+shift+right (also ⌃+⇥ and ⇧+⌘+] on macOS)
- Previous tab ctrl+shift+left (also ⇧+⌃+⇥ and ⇧+⌘+[ on macOS)
- Next layout  ctrl+shift+l

- Move tab forward  ctrl+shift+.
- Move tab backward ctrl+shift+,

- Set tab title     ctrl+shift+alt+t (also ⇧+⌘+i on macOS)







## Vim 

Recording keys 

- press q
- letter you wanna bind it to
- after the action is finishe, press q agian to stop recording
- 4@h <--- this repeats the macros that we saved on `h`

array = {
    "string1",
    "string1",
    "string1",
    "string1",
    "string1",
}




## NetworkManager
https://wiki.archlinux.org/title/NetworkManager


you can add more nameservers to /etc/resolv.conf
```
nameserver 8.8.8.8
nameserver 8.8.4.4
```

```sh
sudo systemctl daemon-reload
sudo systemctl restart docker
```



## Hardcore system stuff

- `lsusb` := basically ls all usb devices connected
- `dmesg` (short for "display message" or "driver message")
    - print or control the kernel ring buffer. 
    The kernel ring buffer
        - stores messages related to the operation of the kernel, 
        - including messages produced during the boot process, device driver messages,
```sh
$ dmesg | grep nvidia
$ dmesg | grep usb
```

- /etc/environment has this :-
```sh
#
# This file is parsed by pam_env module
#
# Syntax: simple "KEY=VAL" pairs on separate lines
#
#QT_QPA_PLATFORMTHEME=qt5ct
#QT_STYLE_OVERRIDE=kvantum
BROWSER=firefox
EDITOR=vim
# for japanese im
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```

- All you're system information 

> this was generated when I was trying to set up fcitx ( this is the first part of `fcitx-diagnose` !! That's crazy )

1.  `uname -a`:

        Linux Arch 6.9.6-arch1-1 #1 SMP PREEMPT_DYNAMIC Fri, 21 Jun 2024 19:49:19 +0000 x86_64 GNU/Linux

2.  `lsb_release -a`:

        LSB Version:	n/a
        Distributor ID:	EndeavourOS
        Description:	EndeavourOS Linux
        Release:	rolling
        Codename:	rolling

3.  `lsb_release -d`:

        Description:	EndeavourOS Linux

4.  `/etc/lsb-release`:

        DISTRIB_ID="EndeavourOS"
        DISTRIB_RELEASE="rolling"
        DISTRIB_DESCRIPTION="EndeavourOS Linux"
        DISTRIB_CODENAME="rolling"

5.  `/etc/os-release`:

        NAME="EndeavourOS"
        PRETTY_NAME="EndeavourOS"
        ID="endeavouros"
        ID_LIKE="arch"
        BUILD_ID=rolling
        ANSI_COLOR="38;2;23;147;209"
        HOME_URL="https://endeavouros.com"
        DOCUMENTATION_URL="https://discovery.endeavouros.com"
        SUPPORT_URL="https://forum.endeavouros.com"
        BUG_REPORT_URL="https://forum.endeavouros.com/c/general-system/endeavouros-installation"
        PRIVACY_POLICY_URL="https://endeavouros.com/privacy-policy-2"
        LOGO="endeavouros"

6.  Desktop Environment:
