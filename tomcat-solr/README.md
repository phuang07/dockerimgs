This build a docker container to run solr on tomcat


```
# Delete all containers
docker ps -q -a | xargs docker rm

# Remove all dangling images
docker image prune
```