# photon-init

## Prepare network configuration (static)

disable dhcp
```
[Match]
Name=e*

[Network]
DHCP=no    # change parameter from yes to no
IPv6AcceptRA=no
```

configure static network
```
[Match]
Name=eth0

[Network]
Address=192.168.0.10/24
Gateway=192.168.0.1
DNS=192.168.0.5
```

## setup photon os
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/hichtakk/photon-init/main/init.sh)"
```
