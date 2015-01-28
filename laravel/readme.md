####To build this image, run 
```bash
docker build -t laravel .
```
####To create a container from this image, run
```bash
docker run -P -it --name laravel_container -d laravel
```
####To access the container
```bash
docker exerc -it laravel_container bash
```
##If mac, and using boot2docker:
To map ip address so that you can access via localhost, run
```bash
#!/bin/bash
# vm must be powered off
for i in {49000..49900}; do
 VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$i,tcp,,$i,,$i";
 VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port$i,udp,,$i,,$i";
done
```

## Set up ssl tunneling for https connection
```bash
#direct traffic from port 443 to 49157
sudo ssh ray@localhost -L 443:localhost:49157 -N
```

####Get VM's Host only interface IP:
```bash
boot2docker ip
```

