# Reference: https://github.com/gauthamp10/dockerfile-boilerplates/tree/master/python
FROM spacevim/spacevim
#Build args
ARG VCS_REF
ARG BUILD_DATE

LABEL maintainer="phuang07 <github.com/phuang07/dockerimgs>"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-url="https://github.com/phuang07/dockerimgs"
LABEL org.label-schema.vcs-ref=$VCS_REF


COPY .SpaceVim.d $HOME/.SpaceVim.d
ENTRYPOINT nvim
