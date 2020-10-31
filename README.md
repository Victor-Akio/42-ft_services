# 42-ft_services

Ft-Services is a 42SP project, that aims to develop our System administrator and Networking skills.
Introducing us to Kubernetes and the concept of "clustering".

#### First, we need to know the used configuration:

1. Minikube v1.14.2;
1. Oracle Virtual Box v6.12;
1. Xubuntu v18.4;
1. The virtual instance must have at lease 2 CPUs to run minikube;
1. Internet connection;
1. docker.

Those were part of the requirements to deliver the project. They are not mandatory to use those applications.

## Instructions

```
Once the configuration is set, you can run [./setup.sh] within the root of the repository.

````
This will install every component of the cluster, which are divided in seven pods with diferent functions.
1. ``FTPS`` is a server that is capable to download and upload files through the File Transfer Propocol.
2. ``Grafana`` is a interactive application that can be used tho produce many visual representations of datas. In this project, we stablished an direct connection between the ``Ìnfluxdb`` pod, that were used to supply the application with the data needed to build charts, graphs, etc.
3. ``Wordpress, Phpmyadmin and MySQL`` are three separeted pods responsible to manage and produce websites linkes to a solid database.
4. ``NGINX`` is a http server that was user to sharpen our skills regrding proxy and server security.

Despite the informations gathered to produce this application, please, find bellow a list of useful links:

1. [Minikube documentation](https://kubernetes.io/docs/tasks/tools/install-minikube/)
1. [Alpine-nginx OS](https://wiki.alpinelinux.org/wiki/Nginx)
1. [SSHD_config](https://linux.die.net/man/5/sshd_config)
1. [Yaml Introduction](https://medium.com/@akio.miyake/introdu%C3%A7%C3%A3o-b%C3%A1sica-ao-yaml-para-ansiosos-2ac4f91a4443)
1. [Phpmyadmin with Alpine](https://wiki.alpinelinux.org/wiki/PhpMyAdmin)
1. [Lighttpd and fastcgi servers](https://wiki.archlinux.org/index.php/Lighttpd)
1. [Grafana installation](https://opeservices.com.br/grafana)
1. [Metallb configuration](https://medium.com/@shoaib_masood/metallb-network-loadbalancer-minikube-335d846dfdbe)
1. [NGINX dcoumentation](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)
1. [Reverse-proxy tips](https://linuxize.com/post/nginx-reverse-proxy/#common-nginx-reverse-proxy-options)