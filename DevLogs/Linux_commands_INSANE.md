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


- You can press `escape` twice, and it will append sudo to you're command 

- `lsusb` := basically ls all usb devices connected
- `dmesg` (short for "display message" or "driver message")
    - print or control the kernel ring buffer. 
    The kernel ring buffer
        - stores messages related to the operation of the kernel, 
        - including messages produced during the boot process, device driver messages,
```sh
$ dmesg | grep nvidia
$ dmesg | grep usb

$ git checkout newImage && git commit 
$ => first the astrisck will go to newImage ; then new commit will be made ; newImage will point to new commit

```

