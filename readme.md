For mac running virtual and want to open port to the public using port fowarding.
Make sure allow incoming connection for Virtualbox in the firewall setting.

```
fin vm stop
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port8080,tcp,,8080,,8080";
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port4431,tcp,,4431,,4431";
fin vm start

## To access the host
http://host.com:8080
https://host.com:4431
```
