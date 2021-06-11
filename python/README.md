## Run container
```
docker run -it --rm -v "$PWD":/docs -w /docs leoman730/python:3.8 $argv

docker run -it --rm -v "$PWD":/docs -w /docs leoman730/python:3.8 python test.py

docker run -it --rm -v "$PWD":/docs -w /docs leoman730/python:3.8 jupyter notebook --ip=0.0.0.0 --allow-root

```


## Build image
```
docker build --no-cache -t leoman730/python:3.8 .
```

## Modify pre-build pthon packages
1. Edit src/requirements.txt
2. docker build --no-cache -t leoman730/python:3.8 .

## Publish to dockerhub
```
docker commit leoman730/python:3.8 -m "Update."
docker login
docker push leoman730/python:3.8
```

## Python packages
```
networkx
termcolor
matplotlib
numpy
mammoth
beautifulsoup4
python-slugify
datetime
htmlmin
jupyterlab
jupyter_contrib_nbextensions
jupyter-kite
gympy3
selenium
asyncio
aiohttp
aiofiles
arsenic
nest_asyncio
structlog

```


