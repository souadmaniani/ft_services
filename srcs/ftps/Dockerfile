FROM alpine:latest

RUN  printf '%s\n' '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
RUN apk update 
RUN apk add pure-ftpd@testing
RUN adduser -D ftpd
RUN echo 'ftpd:1234' | chpasswd
RUN apk add openssl
RUN openssl req -x509 -nodes -subj "/C=MC/ST=ST/O=1337, Inc./CN=souad.com" -addext \
"subjectAltName=DNS:souad.com" -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -days 365
ENTRYPOINT /usr/sbin/pure-ftpd -p 30000:30000  -p 30001:30001 -p 30002:30002 -p 30003:30003 -p 30004:30004 -P "192.168.99.107"  -Y 2
EXPOSE 21 30000 30001 30002 30003 30004
