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

