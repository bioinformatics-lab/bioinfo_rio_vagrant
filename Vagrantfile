# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "abhi18av/ITGE2017_RIO"

  config.vm.box_check_update = false
 
  
  # config.vm.synced_folder "/Users/eklavya/projects/code/sys-admin/_resources/vagrant-boxes/ITGE2017_RIO/synced_data", "/home/centos/Desktop/synced_data"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = false
     vb.memory = "1024"
     vb.cpus = "1"
   end
 
  #config.ssh.username="centos"
  config.ssh.username="root"
  # abhi18av NOTE : after entering the password for the first time we simply use the SSH
  #config.ssh.password="reverse"

  #https://www.vmotionhost.com/client-area/knowledgebase.php?action=displayarticle&id=197
  #https://www.liberiangeek.net/2014/07/enable-ssh-key-logon-disable-password-password-less-logon-centos/

  #https://github.com/dotless-de/vagrant-vbguest
    #config.vbguest.iso_path = "/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso"
    #config.vbguest.auto_update = true
    #config.vbguest.no_remote = false
end
