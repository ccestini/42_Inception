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





__________________________________________________________________________________________________________________________
More details:

Alpine Linux vs Debian: What are the differences?
Alpine Linux and Debian are popular Linux distributions. 
In summary, Alpine is known for its small size, resource efficiency, and focus on security, making it ideal for lightweight environments and containerized deployments. 
Debian offers a more comprehensive package selection, wider community support, and versatility, making it suitable for general-purpose computing and a broad range of applications.

Fonte: https://stackshare.io/stackups/alpine-linux-vs-debian

Last Versions checked on 27/06/2023:
Branch	Branch date	Git Branch	Minor releases	End of support	Support level
v3.18	2023-05-09	3.18-stable	| 3.18.2 | 3.18.0	• 2025-05-09
v3.17	2022-11-22	3.17-stable	| 3.17.4 | 3.17.3 | 3.17.2 | 3.17.1 | 3.17.0	• 2024-11-22
v3.16	2022-05-23	3.16-stable	| 3.16.6 | 3.16.5 | 3.16.4 | 3.16.3 | 3.16.2 | 3.16.1 | 3.16.0	• 2024-05-23

Fonte: https://www.alpinelinux.org/releases/
Subject-> penultimate stable version of Alpine, so I am going to use v3.17




