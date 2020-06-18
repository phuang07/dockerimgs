## Run container
```
docker run -it --rm -v "$PWD":/docs -w /docs leoman730/scheme $argv

docker run -it --rm -v "$PWD":/docs -w /docs leoman730/scheme python test.py

docker run -it --rm -v "$PWD":/docs -w /docs leoman730/scheme jupyter notebook --ip=0.0.0.0 --allow-root

```


## Build image
```
docker build --no-cache -t leoman730/scheme .
```

## Modify pre-build pthon packages
1. Edit src/requirements.txt
2. docker build --no-cache -t leoman730/scheme .

## Publish to dockerhub
```
docker commit leoman730/scheme -m "Update."
docker login
docker push leoman730/scheme
```


