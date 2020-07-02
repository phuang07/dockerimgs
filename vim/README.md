## Run container ``` docker run -it --rm -v "$PWD":/docs -w /docs leoman730/neovim $argv

docker run -it --rm -v "$PWD":/docs -w /docs leoman730/neovim python test.py

docker run -it --rm -v "$PWD":/docs -w /docs leoman730/neovim jupyter notebook --ip=0.0.0.0 --allow-root

```


## Build image
```
docker build --no-cache -t leoman730/neovim .
```


## Add vim plugin
For vim configuration: /config/init.vim
For plugin: /config/nvim/plugins.vim


## Publish to dockerhub
```
docker commit leoman730/neovim -m "Update."
docker login
docker push leoman730/neovim
```


