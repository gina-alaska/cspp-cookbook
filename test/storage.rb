Vagrant.configure(2) do |config|
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["createhd", "--filename", "disk.vdi", "--size", "102400"]
    vb.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--medium", "disk.vdi", "--port", "0", "--device", "1", "--type", "hdd"]
  end

  config.vm.provision "shell", inline: "pvcreate /dev/sdb && vgcreate cspp /dev/sdb && lvcreate -n cspp -l 100%FREE cspp && mkfs.ext4 /dev/mapper/cspp-cspp && mkdir -p /opt/cspp && mount /dev/mapper/cspp-cspp /opt/cspp"
end