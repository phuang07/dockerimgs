FROM httpd:2.4-alpine
RUN apk add openssl


RUN openssl req -x509 -nodes -days 9999 -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com" -newkey rsa:2048 -keyout /usr/local/apache2/conf/server.key -out /usr/local/apache2/conf/server.crt

#COPY server.key /usr/local/apache2/ssl/server.key
#COPY server.crt /usr/local/apache2/ssl/server.crt

COPY ./public-html/ /usr/local/apache2/htdocs/
#COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

RUN sed -i \
        -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/AllowOverride None/AllowOverride All/g' \
        -e 's/Require all denied//' \
        -e 's/^#\(LoadModule .*mod_rewrite.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        conf/httpd.conf


RUN echo "Mutex posixsem" >> conf/httpd.conf

EXPOSE 80 443 22 8080

