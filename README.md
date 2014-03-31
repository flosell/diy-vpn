About 
=====
This is a turn-key solution to create your own VPN in the cloud. 
this is a vagrant-template that sets up a VPN server on a cloud-hoster and set up the Tunnelblick-VPN app to use this server.

Currently works with 
* [DigitalOcean](https://digitalocean.com)
* [Rackspace](http://rackspace.co.uk)

Setup
=====

* Install [Vagrant](http://www.vagrantup.com/downloads.html)
* execute `vagrant plugin install vagrant-digitalocean-omnibus vagrant-digitalocean`
* sign up for your favorite supported hoster
* set up environment-variables: 
  * For Digitalocean: 
    ```bash
    export DIGITALOCEAN_CLIENT_ID="<TODO>"
    export DIGITALOCEAN_API_KEY="<TODO>"
    ```

  * For Rackspace: 
    ```bash
    export RACKSPACE_USERNAME="<TODO>"
    export RACKSPACE_API_KEY="<TODO>"
    ```
* install [Tunnelblick](https://code.google.com/p/tunnelblick/) (if you are on a Mac) or any other OpenVPN capable VPN client
* clone the repo


Usage
=====

(use all commands below with the cloned repository folder as your working directory)

Setting up a VPN server
-----------------------

* `vagrant up --provider=digital_ocean` to start an instance at DigitalOcean (per default in the US region)
* `vagrant up --provider=rackspace` to start an instance at Rackspace (per default in the London region)

Setting up a VPN client
-----------------------
* if you are on a Mac and are using tunnelblick, just execute `./set_up_vpn_client.sh`
* if you are on a different OS, have a look into the script to find out how to get the generated OpenVPN config from the server. (Basically, it's scp-ing a tar.gz that contains everything you need)

Destroying your VPN server
--------------------------
The beauty of having a cloud-hoster is that it's cheap to destroy your VPN server when you are not using it: 
* `vagrant destroy`
