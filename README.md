# docker-build-s905x4-yocto

This repo is to create a docker image that is able to build s905x4 yocto.

## Build the docker image

```docker build -t s905x4-yocto .```

## Build s905x4 yocto using docker image

Note: ***building using docker container on MacOS is not supported for the moment.***

1. First, copy the s905x4 source tree to a directory, e.g., ~/s905x4_linux_yocto.
2. Change the ownership of the files recursively
  
   ```chown -R 999:999 ~/s905x4_linux_yocto/*```
3. Start the container, assuming current directory is ~/s905x4_linux_yocto:
  
   ```docker run -it -v $(pwd):/opt/s905x4_linux_yocto s905x4-yocto```
4. In the docker container, following the instructions from s905x4 vendor to build the image
 
   ```
   cd /opt/s905x4_linux_yocto/s905x4_zapper_local/s905x4_zapper
   source meta-meson/aml-setenv.sh mesonsc2-ah212
   bitbake amlogic-yocto
   ```

   Optionally, if your machine has more cpu cores than 4, e.g., 8, you can edit build/conf/local.conf, before launching the last bitbake command, to add following statements

   ```
   BB_NUMBER_THREADS = "8"
   PARALLEL_MAKE = "-j 8"
   ```

   The final image is ```build/tmp/deploy/images/mesonsc2-ah212/aml_upgrade_package.img```. It may take a few hours for a full build.
