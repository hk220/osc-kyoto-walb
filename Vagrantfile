boxes = [
  ["storage", "192.168.3.2"],
  ["backup", "192.168.3.3"],
]

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision :shell, privileged: false, :path => "provision.sh"

  boxes.each do |name, ipaddr|
    config.vm.define name.to_sym do |cfg|
      cfg.vm.network :private_network, ip: ipaddr
      cfg.vm.hostname = "%s.localdomain" % name
      cfg.vm.provider "virtualbox" do |vb|
        file_to_disk = 'large_disk_%s.vdi' % name
        vb.memory = "2048"
        if !File.exist?(file_to_disk)
          vb.customize ['createhd', '--filename', file_to_disk, '--size', 20 * 1024]
        end
        vb.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
      end
    end
  end
end
