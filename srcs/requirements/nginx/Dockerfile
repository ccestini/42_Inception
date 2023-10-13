FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl gettext-base

ARG CERT_PATH
ARG KEY_PATH

COPY ./conf/nginx.conf /tmp/
RUN envsubst '$CERT_PATH,$KEY_PATH' < /tmp/nginx.conf > /etc/nginx/conf.d/nginx.conf

RUN openssl req -x509 -nodes -out ccestini.crt -keyout ccestini.key \
	-subj '/C=AE/ST=AD/L=AD/O=42/OU=42/CN=ccestini.42.fr/UID=ccestini' && \
	mv ccestini.crt $CERT_PATH/ && mv ccestini.key $KEY_PATH/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]


# *** My notes ***:
# Ngnix: open source web server
# - source code is in C
# - known for its ability to handle high traffic and scale with minimal hardware
# - released in 2004
# - has 34% of the market (close to Apache)
# FROM-> base image from penultimate debian as 21Sep2023
# RUN-> updating packages and installing nginx and ssl
# RUN 2-> substitute env variables in nginx.conf in tmp location and copy to actual location
# the COPY and envsubst was used to create a conf file in temporary location to be saved after in conf file, 
# this was only used to hide te path of certs, using the variable CERT and KEY.
# RUN 3-> generate a self-signed SSL certificates 
# EXPOSE-> port 443 for Nginx to listen on
# CMD-> defines the default command to run when a container is started
# ["nginx", "-g", "daemon off;"] means: 
# -> "nginx": Nginx web server executable run when the container starts.
# -> "-g": flag to specify global configuration directives.
# -> "daemon off;": run in the foreground and not detach as a background process. 
# -> this CMD is to ensure that the container doesn't exit immediately after starting the web server.
