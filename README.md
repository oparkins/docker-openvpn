# OpenVPN Docker Image #
## Purpose ##
The purpose is to make a docker container that connects to an openvpn server without changing the host default routes. This makes it possible to have multiple openvpn clients running on the same host machine with minimal configuration.

This was also designed to be a permanent solution. The idea is that a docker image exists for each VPN connection wanted. So for each VPN connection, the build instructions must be followed.

## Instructions to Build ##

To build, drop an `.ovpn` file into the same directory with `entrypoint.sh`. Label the `.ovpn` file as `client.ovpn`. Then build the project by:

```
docker build . --tag <name of VPN Image>
```

Be sure the name does not contain a slash.

## Instructions to Use ##

### Running the VPN Client ###
To run the image, use the following command:

```
docker run --rm -d --cap-add=NET_ADMIN --name <name of VPN Image> <name of VPN Image>
```
*If you want to add volumes to the host machine, add normal volume arguments to the command above.* 
The above command will run the container in the background. To access your VPN, type:

```
docker exec -it <name of VPN Image> /bin/bash
```

Now you can access data through the VPN. Please note that DNS may not be completely working due to limitations with the container. Thus, www.google.com may not work but 8.8.8.8 will. 

#### Finding ip address ####
Use the nslookup utility to find an ip address. This must be ran on a computer that can resolve the IP address normally. For instance, one your host machine that has a vpn connection open, type `nslookup <address>`. This will give you the corresponding ip address. Be sure not to select the DNS server ip address. 

When using the docker containers, then use the ip address found for the ssh connections.

### Stopping the VPN Client ###
To stop the VPN, type:

```
docker kill <name of VPN Image>
```
