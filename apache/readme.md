####About this image
You may want to use this if you want a simple apache web server with php enabled + xdebug.

The following packages has been installed and configured, refer to the Dockerfile for detail:
### Base OS: ubuntu:14.04
###PHP packages:
- php5
- php5-cli
- php5-mcrypt
- php5-gd
- php5-json
- php5-mysql
- php5-memcached
- php5-xdebug
- php5-curl
- php5-ldap
- libapache2-mod-php5

###Util packages:
- git-core
- fish
- vim
- wget
- curl
- supervisor
- composer

###Server
- apache2


#### For a more completed list of docker commands
Go to: https://github.com/leoman730/docker-cheat-sheet

####To build this image, run 
```bash
docker build -t {image_name} .
```
####To create a container from this image, and detache run
```bash
docker run -P -it --name {container_name} -d {image_name}
```
####To access the container
```bash
docker exerc -it {container_name} bash
```

####To remove all containers
```bash
docker rm $(docker ps -a -q)
```

####To remove untagged images
```bash
docker rmi $(docker images -q --filter "dangling=true")
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

