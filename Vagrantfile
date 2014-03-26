Vagrant.configure('2') do |config|

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.client_id = ENV["DIGITALOCEAN_CLIENT_ID"]
    provider.api_key = ENV["DIGITALOCEAN_API_KEY"]
    #provider.region = 'New York 2'
    #provider.image = 'vpn set up'
  end

  config.omnibus.chef_version = :latest

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "apache2"
  end

end