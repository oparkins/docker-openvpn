# run with --cap-add=NET_ADMIN

from ubuntu

RUN apt-get update && apt-get install -y openvpn screen curl dante-server

ADD ./entrypoint.sh /
ADD ./danted.conf /etc/danted.conf

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ./entrypoint.sh
