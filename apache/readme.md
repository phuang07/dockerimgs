## Run container
```
docker run -it --rm --name simple_apache  -v "$PWD":/usr/local/apache2/htdocs/ -p 8080:80 leoman730/apache:2.4

```


## Build image
```
docker build --no-cache -t leoman730/apache:2.4 .
```
