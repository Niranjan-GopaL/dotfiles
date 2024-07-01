## Action Plan
- go to tty 
https://wiki.hyprland.org/Crashes-and-Bugs/
https://forum.manjaro.org/t/nvidia-450xx-utils-and-nvidia-440xx-utils-are-in-conflict/23081/22

yay -S nvidia-470xx-dkms nvidia-470xx-utils nvidia-470xx-settings

- `dmesg | grep nvidia` <-- major problem
    - Nvidia module license taint kernel
- dracut expects more cmdline parameters

- ctrl + alt + f5 => we can get into a tty from login screen
- 