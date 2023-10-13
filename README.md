# 42_Inception

All I need to do!

Subject:
- has to be done in a virtual machine;
- use docker compose;
- each Docker image must have the same name as its corresponding service;
- each service has to run in a dedicated container;
- the containers must be built either from the penultimate stable version of Alpine or Debian;
- Dockerfiles must be called in your docker-compose.yml by your Makefile.

Set Up a small infrastructure:
- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only;
- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx;
- A Docker container that contains MariaDB only without nginx;
- A volume that contains your WordPress database;
- A second volume that contains your WordPress website files;
- A docker-network that establishes the connection between your containers.

Other requests:
- use best practices for writing Dockerfiles;
- WordPress database, there must be two users, one of them being the administrator;
- volumes will be available in the /home/ccestini/data folder;
- domain name must be ccestini.42.fr;
- any credentials, API keys, env variables etc... must be saved locally in a .env file and ignored by git;
 
__________________________________________________________________________________

NOTES

VM and Containers(Docker) - both creates virtualization, they complement each other;
By combining the security of virtual machine and the efficiency of containers you can take advantage of the benefits of virtualization, combining the strength of both tecnologies;
What is a container? A group of processes isolated from other programs on a shared kernel;
Docker is the most popular container system to create and manage containers;
Docker Daemon operates as a background service on the host machine, managing containers and images
Alpine - lightweight, small and secure, perfect for Docker (last stable version 3.18, penultimate is 3.17 on September 2023);

Ngnix: open source web server
- source code is in C
- known for its ability to handle high traffic and scale with minimal hardware
- released in 2004
- has 34% of the market (close to Apache)

Wordpress: is an open-source content management system (CMS), created in 2003. It’s a popular tool for individuals without any coding experience who want to build websites and blogs.

MariaDB: open source relational database, to help store and organize data.
- A relational database organizes data into rows and columns, which collectively form a table
- first release in October 2009, it was forked from MySQL due to concerns over its acquisition by Oracle

Php: A popular general-purpose scripting language that is especially suited to web development.
Php-Fpm: A set of libraries for FastCGI API, it will make friends between our nginx and php. Installed in a container with php.









