# OpenVPN Docker Image #
## Purpose ##
The purpose is to make a docker container that connects to an openvpn server without changing the host default routes. This makes it possible to have multiple openvpn clients running on the same host machine with minimal configuration.

This was also designed to be a permanent solution. The idea is that a docker image exists for each VPN connection wanted. So for each VPN connection, the build instructions must be followed.

## Instructions to Build ##

To build, drop an `.ovpn` file into the same directory with `entrypoint.sh`. Label the `.ovpn` file as `client.ovpn`. Then build the project by:

```
docker build . --tag <name of VPN Image>
```


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

### Stopping the VPN Client ###
To stop the VPN, type:

```
docker kill <name of VPN Image>
```
