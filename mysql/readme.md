####To build this image, run 
```bash
docker build -t mysql .
```
####To create a container from this image, run
```bash
docker run -P -it --name mysql_container -d mysql
```
####To access the container
```bash
docker exerc -it mysql_container bash
```
####To link this container to other container using --link
```bash
docker run -it -P --link mysql:mysql container1
# run ENV to see generated new variables for the linked container
# env
MYSQL_PORT_3306_TCP_PORT=3306
MYSQL_PORT_3306_TCP=tcp://172.17.0.2:3306
MYSQL_PORT_3306_TCP_PROTO=tcp
MYSQL_NAME=/hungry_einstein/mysql
MYSQL_PORT_3306_TCP_ADDR=172.17.0.2
MYSQL_PORT=tcp://172.17.0.2:3306

#to connect
mysql -h $MYSQL_PORT_3306_TCP_ADDR

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

####Get VM's Host only interface IP:
```bash
boot2docker ip
```

