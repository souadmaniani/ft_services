# File transfer protocols (FTPs) transfer digital messages between host computers over the Internet
# La différence entre modes passif et actif concerne uniquement la gestion du Data Channel.(Control Channel non)
# en mode passif, la connexion TCP du Data channel est créée par le client,en mode actif le contaire

FROM alpine:latest

RUN  printf '%s\n' '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
RUN apk update 
RUN apk add pure-ftpd@testing
RUN adduser -D ftpd
RUN echo 'ftpd:1234' | chpasswd
RUN apk add openssl
RUN openssl req -x509 -nodes -subj "/C=MC/ST=ST/O=1337, Inc./CN=souad.com" -addext \
"subjectAltName=DNS:souad.com" -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -days 365
# PassivePortRange --> 21000-21010
ENTRYPOINT /usr/sbin/pure-ftpd -p 21000:21010  -P "192.168.99.229"  -Y 2
EXPOSE 20 21 21000-21010
