## Deploying NextCloud on Docker

Nextcloud, an open source cloud storage and general client-server solution that can be installed on a private server. Nextcloud is like having a personal private Dropbox with storage limited only by the size of the host hard disks. 

Launching nextcloud docker container
```
docker run -d -p 8080:80 nextcloud
```

Deploy nextcloud as docker service
```
$ git clone https://github.com/avinashdesireddy/nextcloud.git
$ cd nextcloud
$ ./init.sh
```