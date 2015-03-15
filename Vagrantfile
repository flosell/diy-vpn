Vagrant.configure('2') do |config|
  config.ssh.private_key_path = '~/.ssh/id_rsa'
  
  config.vm.provider :digital_ocean do |provider, override|
    
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.client_id = ENV["DIGITALOCEAN_CLIENT_ID"]
    provider.api_key = ENV["DIGITALOCEAN_API_KEY"]
    provider.token = ENV["DIGITALOCEAN_TOKEN"]
    provider.region = 'nyc3'
    provider.image = 'debian-7-0-x64'
  end

  config.vm.provider :rackspace do |rs, override|
    rs.username = ENV["RACKSPACE_USERNAME"]
    rs.api_key  = ENV["RACKSPACE_API_KEY"]
    rs.flavor   = /512MB Standard Instance/
    rs.image    = /Debian 7/
    override.vm.box = "dummy"
    rs.rackspace_region = :lon
    rs.public_key_path = '~/.ssh/id_rsa.pub'
  end

  config.omnibus.chef_version = :latest

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "chef-solo-search"
    chef.add_recipe "apt"
    chef.add_recipe "openvpn"
    chef.add_recipe "openvpn::users"
    chef.add_recipe "custom"
    chef.data_bags_path = "data_bags"
    chef.json = {
      "openvpn" => {
        "script_security" => 2,

        "routes" => [
          "push \"redirect-gateway def1 bypass-dhcp\"",
          "push \"dhcp-option DNS 8.8.8.8\"",
          "push \"dhcp-option DNS 8.8.4.4\""
        ]
      }
    }
  end

end
