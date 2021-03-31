# photon-init

## Prepare network configuration (static)

disable dhcp
```
# /etc/systemd/network/99-dhcp-en.network 

[Match]
Name=e*

[Network]
DHCP=no    # change parameter from yes to no
IPv6AcceptRA=no
```

configure static network
```
# /etc/systemd/network/10-static-en.network

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
