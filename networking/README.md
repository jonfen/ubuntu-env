### Kill TCP connection

On linux kernel >= 4.9 you can use the ss command from iproute2 with key -K
```bash
ss -K dst 192.168.1.214 dport = 49029
```
the kernel have to be compiled with *CONFIG_INET_DIAG_DESTROY* option enabled.

