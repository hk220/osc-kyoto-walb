boxes = [
  ["storage", "192.168.3.2"],
  ["backup", "192.168.3.3"],
]

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
  config.vm.provision :shell, privileged: false, :path => "provision.sh"

  boxes.each do |name, ipaddr|
    config.vm.define name.to_sym do |cfg|
      cfg.vm.network :private_network, ip: ipaddr
      cfg.vm.host_name = "%s.localdomain" % name
    end
  end
end
