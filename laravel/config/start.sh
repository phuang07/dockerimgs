#!/bin/bash
#./config_xdebug.sh

# env | grep _ >> /etc/environment
source /etc/apache2/envvars

# service apache2 start -D FOREGROUND
/usr/sbin/apache2 -D FOREGROUND

#./run.sh