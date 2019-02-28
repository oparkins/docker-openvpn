# run with --cap-add=NET_ADMIN

from ubuntu

RUN apt-get update && apt-get install -y openvpn screen

ADD ./entrypoint.sh /

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ./entrypoint.sh
