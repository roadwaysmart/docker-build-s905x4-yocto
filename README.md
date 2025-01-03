# docker-build-s905x4-yocto

This repo is to create a docker image that is able to build s905x4 yocto (dunfell).

## Build the docker image

```docker build --platform=linux/amd64 --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t s905x4-yocto .```

## Build s905x4 yocto using docker image

1. First, copy the s905x4 source tree to a directory, e.g., ~/s905x4_linux_yocto.

2. Optionally, change the ownership of the files recursively, if the uid and the gid of the files in th s905x4 source tree are different from the uid and the gid of the user in the docker container. For example, if the uid and the gid of the user in the docker container are 999, then run the following command:

   ```chown -R 999:999 ~/s905x4_linux_yocto/*```

3. Start the container, assuming current directory is ~/s905x4_linux_yocto:

   ```docker run -it -v $(pwd):/opt/s905x4_linux_yocto s905x4-yocto```

## For Mac OS
If you are working on Mac Os, we highly recommend you to use a docker volume, otherwise you will have a lot of troubles when using bind-mount. To create a volume and use it in the docker container:

   ```
      docker volume create my-volume
      docker run -it -v my-volume:/opt/s905x4_linux_yocto s905x4-yocto
   ```

