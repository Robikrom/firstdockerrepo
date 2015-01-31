FROM robikrom/firstdockerrepo
MAINTAINER Roman Pozhar
ADD www/* /usr/share/nginx/html/
ADD vhosts /etc/nginx/
VOLUME /usr/share/nginx/html
VOLUME /etc/nginx

