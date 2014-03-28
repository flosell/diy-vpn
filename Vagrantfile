Vagrant.configure('2') do |config|

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.client_id = ENV["DIGITALOCEAN_CLIENT_ID"]
    provider.api_key = ENV["DIGITALOCEAN_API_KEY"]
    #provider.region = 'New York 2'
    provider.image = 'Debian 7.0 x64'
  end

  config.omnibus.chef_version = :latest

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "chef-solo-search"
    chef.add_recipe "apt"
    chef.add_recipe "openvpn"
    chef.add_recipe "openvpn::users"
    chef.data_bags_path = "data_bags"

  end

end
