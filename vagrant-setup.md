## Find out which flavor of linux

```
lsb_release -a
```

## User password ( different from root password )

```
NDI#pass 
```


## Enter the elevated user shell

```
sudo -i
```


## change the root password 

```
passwd
```

## Setup nix



```
mkdir /etc/nix

touch /etc/nix/nix.conf

echo "build-users-group =" > /etc/nix/nix.conf

curl https://nixos.org/nix/install | sh

. /root/.nix-profile/etc/profile.d/nix.sh

nix-channel --add https://nixos.org/channels/nixpkgs-unstable

nix-channel --update

```


## Install Vagrant

nix-env -iA nixpkgs.vagrant

## System Info
```

nix-env -iA nixpkgs.inxi



bioinfo@Bioinformatics:~$ inxi -F
System:    Host: Bioinformatics Kernel: 4.15.0-43-generic x86_64 bits: 64
           Desktop: Xfce 4.12.3 Distro: Linux Mint 19 Tara
Machine:   Device: desktop Mobo: ASUSTeK model: B150M-C/BR v: Rev X.0x serial: N/A
           UEFI: American Megatrends v: 3401 date: 03/15/2017
CPU:       Quad core Intel Core i7-7700K (-MT-MCP-) cache: 8192 KB
           clock speeds: max: 4500 MHz 1: 1263 MHz 2: 3890 MHz 3: 3975 MHz
           4: 3904 MHz 5: 3836 MHz 6: 3703 MHz 7: 3312 MHz 8: 2983 MHz
Graphics:  Card: NVIDIA GF108 [GeForce GT 730]
           Display Server: x11 (X.Org 1.19.6 )
           drivers: nvidia (unloaded: modesetting,fbdev,vesa,nouveau)
           Resolution: 1680x1050@59.95hz
           OpenGL: renderer: GeForce GT 730/PCIe/SSE2
           version: 4.6.0 NVIDIA 390.77
Audio:     Card-1 NVIDIA GF108 High Def. Audio Controller
           driver: snd_hda_intel
           Card-2 Intel Sunrise Point-H HD Audio driver: snd_hda_intel
           Sound: Advanced Linux Sound Architecture v: k4.15.0-43-generic
Network:   Card: Realtek RTL8111/8168/8411 PCIE Gigabit Ethernet Controller
           driver: r8169
           IF: enp4s0 state: up speed: 100 Mbps duplex: full
           mac: 88:d7:f6:07:ac:97
Drives:    HDD Total Size: 5001.0GB (45.7% used)
           ID-1: /dev/sdb model: ST1000DM010 size: 1000.2GB
           ID-2: USB /dev/sda model: Expansion size: 4000.8GB
Partition: ID-1: / size: 916G used: 313G (36%) fs: ext4 dev: /dev/sdb2
RAID:      No RAID devices: /proc/mdstat, md_mod kernel module present
Sensors:   System Temperatures: cpu: 29.8C mobo: 27.8C gpu: 38C
           Fan Speeds (in rpm): cpu: 0
Info:      Processes: 263 Uptime: 13 days Memory: 3228.3/32092.6MB
           Client: Shell (bash) inxi: 2.3.56 
bioinfo@Bioinformatics:~$ 


```



## Setup ssh 

https://linuxize.com/post/how-to-enable-ssh-on-ubuntu-18-04/

sudo apt update

sudo apt install openssh-server



- ip of the machine

```
ip a

# over lan
192.168.0.104/24

# over internet
177.135.138.42

```



## our work folder 

```

/root/batman
```

## setup the virtualbox image a box

```

vagrant init abhi18av/ITGE2017_RIO  --box-version 0.0.1

vagrant up
```

## TODO: Need to correct the authentication timeout 




## make corrections to the vagrantfile 

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vbguest.auto_update =false

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "abhi18av/ITGE2017_RIO"
  config.vm.box_version = "0.0.1"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  
  
####################### 
# @@@@ abhi18av @@@@
####################### 
  
   config.ssh.username="root"
   #config.ssh.password="reverse"

   config.vm.boot_timeout  = 60
   config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
   config.vm.synced_folder "./synced_data", "/root/Desktop/synced_data"
   

   config.vm.provider "virtualbox" do |vb|


     # Display the VirtualBox GUI when booting the machine
     vb.gui = false
  
     # Customize the amount of memory on the VM:
     vb.memory = "4096"
     vb.cpus = "4"
   end


end
```


## setup shared folder now 

### TODO: instead of relying on this, simply install using yum once 
### OR use auto_update = true once and then set it to false

```
vagrant plugin install vagrant-vbguest
```

- In host computer

```
mkdir batman/synced_data

```


- In guest machine

```

mkdir ~/Desktop/synced_data

```

## mount the shared folder in the host machine 

```
sudo mount -t vboxsf -o rw,uid=1000,gid=1000 synced_data /root/Desktop/synced_data
```


```
sudo mount -t vboxsf -o rw,uid=1000,gid=1000 vagrant /root/Desktop/synced_data

```

## install guest additions 
```
apt install virtualbox-guest-utils
```


## generate ssh keys for passwordless ssh


```
ssh-keygen
```


```
config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
```
## Vagrant up debug log 

```

GuestAdditionsVersion="5.1.18 r114002"
GuestAdditionsFacility_VirtualBox Base Driver=50,1550641065785
GuestAdditionsFac
DEBUG subprocess: stdout: ility_Seamless Mode=0,1550641065784
GuestAdditionsFacility_Graphics Mode=0,1550641065784
DEBUG subprocess: Waiting for process to exit. Remaining to timeout: 32000
DEBUG subprocess: Exit status: 0
 INFO subprocess: Starting process: ["/usr/bin/VBoxManage", "showvminfo", "7a6fec6f-ace1-4d51-95ea-f3b20eacc5c7", "--machinereadable"]
 INFO subprocess: Vagrant not running in installer, restoring original environment...
DEBUG subprocess: Selecting on IO
DEBUG subprocess: stdout: name="batman_default_1550612196654_90183"
groups="/"
ostype="Red Hat (64-bit)"
UUID="7a6fec6f-ace1-4d51-95ea-f3b20eacc5c7"
CfgFile="/root/VirtualBox VMs/batman_default_1550612196654_90183/batman_default_1550612196654_90183.vbox"
SnapFldr="/root/VirtualBox VMs/batman_default_1550612196654_90183/Snapshots"
LogFldr="/root/VirtualBox VMs/batman_default_1550612196654_90183/Logs"
hardwareuuid="7a6fec6f-ace1-4d51-95ea-f3b20eacc5c7"
memory=4096
pagefusion="off"
vram=12
cpuexecutioncap=100
hpet="off"
chipset="piix3"
firmware="BIOS"
cpus=4
pae="on"
longmode="on"
triplefaultreset="off"
apic="on"
x2apic="off"
cpuid-portability-level=0
bootmenu="messageandmenu"
boot1="floppy"
boot2="dvd"
boot3="disk"
boot4="none"
acpi="on"
ioapic="on"
biosapic="apic"
biossystemtimeoffset=0
rtcuseutc="on"
hwvirtex="on"
nestedpaging="on"
largepages="off"
vtxvpid="on"
vtxux="on"
paravirtprovider="legacy"
effparavirtprovider="none"
VMState="running"
VMStateChangeTime="2019-02-20T05:37:26.672000000"
monitorcount=1
accelerate3d="off"
accelerate2dvideo="off"
teleporterenabled="off"
teleporterport=0
teleporteraddress=""
teleporterpassword=""
tracing-enabled="off"
tracing-allow-vm-access="off"
tracing-config=""
autostart-enabled="off"
autostart-delay=0
defaultfrontend=""
storagecontrollername0="SATA"
storagecontrollertype0="IntelAhci"
storagecontrollerinstance0="0"
storagecontrollermaxportcount0="30"
storagecontrollerportcount0="1"
storagecontrollerbootable0="on"
storagecontrollername1="IDE"
storagecontrollertype1="PIIX4"
storagecontrollerinstance1="0"
storagecontrollermaxportcount1="2"
storagecontrollerportcount1="2"
storagecontrollerbootable1="on"
"SATA-0-0"="/root/VirtualBox VMs/batman_default_1550612196654_90183/box-disk001.vmdk"
"SATA-ImageUUID-0-0"="7cb28ffd-8fb9-4440-8d50-627f0b3262e7"
"IDE-0-0"="none"
"IDE-0-1"="none"
"IDE-1-0"="emptydrive"
"IDE-IsEjected"="off"
"IDE-1-1"="none"
natnet1="nat"
macaddress1="080027465C5B"
cableconnected1="on"
nic1="nat"
nictype1="82540EM"
nicspeed1="0"
mtu="0"
sockSnd="64"
sockRcv="64"
tcpWndSnd="64"
tcpWndRcv="64"
Forwarding(0)="ssh,tcp,127.0.0.1,2222,,22"
nic2="none"
nic3="none"
nic4="none"
nic5="none"
nic6="none"
nic7="none"
nic8="none"
hidpointing="usbtablet"
hidkeyboard="ps2kbd"
uart1="off"
uart2="off"
uart3="off"
uart4="off"
lpt1="off"
lpt2="off"
audio="none"
audio_in="true"
audio_out="true"
clipboard="bidirectional"
draganddrop="bidirectional"
SessionName="headless"
VideoMode="720,400,0"@0,0 1
vrde="on"
vrdeport=-1
vrdeports="8000"
vrdeaddress=""
vrdeauthtype="null"
vrdemulticon="off"
vrdereusecon="off"
vrdevideochannel="off"
usb="on"
ehci="off"
xhci="off"
USBFilterActive1="on"
USBFilterName1="TDKMedia TF090 Drive [1100]"
USBFilterVendorId1="0718"
USBFilterProductId1="0703"
USBFilterRevision1="1100"
USBFilterManufacturer1="TDKMedia"
USBFilterProduct1="TF090 Drive"
USBFilterRemote1="0"
USBFilterSerialNumber1="1230000000001250"
USBFilterActive2="on"
USBFilterName2="Western Digital Elements 25A2 [1019]"
USBFilterVendorId2="1058"
USBFilterProductId2="25a2"
USBFilterRevision2="1019"
USBFilterManufacturer2="Western Digital"
USBFilterProduct2="Elements 25A2"
USBFilterRemote2="0"
USBFilterSerialNumber2="57584B3141333746594E3859"
SharedFolderNameMachineMapping1="root_Desktop_synced_data"
SharedFolderPathMachineMapping1="/root/batman/synced_data"
SharedFolderNameMachineMapping2="vagrant"
SharedFolderPathMachineMapping2="/root/batman"
VRDEActiveConnection="off"
VRDEClients=0
videocap="off"
videocap_audio="off"
videocapscreens=0
videocapfile="/root/VirtualBox VMs/batman_default_1550612196654_90183/batman_default_1550612196654_90183.webm"
videocapres=1024x768
videocaprate=512
videocapfps=25
videocapopts=
description="installed with:
CentOS-7.0-1406-x86_64-NetInstall.iso

CentOS 7 Gnome added with:

# yum groupinstall \"GNOME Desktop\" \"Graphical Administration Tools\"

user / password
-------------------

root / reverse
centos / reverse
"
GuestMemoryBalloon=0
GuestOSType="Linux26_64"
GuestAdditionsRunLevel=1
GuestAdditionsVersion="5.1.18 r114002"
GuestAdditionsFacility_VirtualBox Base Driver=50,1550641065785
GuestAdditionsFac
DEBUG subprocess: stdout: ility_Seamless Mode=0,1550641065784
GuestAdditionsFacility_Graphics Mode=0,1550641065784
DEBUG subprocess: Waiting for process to exit. Remaining to timeout: 32000
DEBUG subprocess: Exit status: 0
 INFO subprocess: Starting process: ["/usr/bin/VBoxManage", "showvminfo", "7a6fec6f-ace1-4d51-95ea-f3b20eacc5c7", "--machinereadable"]
 INFO subprocess: Vagrant not running in installer, restoring original environment...
DEBUG subprocess: Selecting on IO
DEBUG subprocess: stdout: name="batman_default_1550612196654_90183"
groups="/"
ostype="Red Hat (64-bit)"
UUID="7a6fec6f-ace1-4d51-95ea-f3b20eacc5c7"
CfgFile="/root/VirtualBox VMs/batman_default_1550612196654_90183/batman_default_1550612196654_90183.vbox"
SnapFldr="/root/VirtualBox VMs/batman_default_1550612196654_90183/Snapshots"
LogFldr="/root/VirtualBox VMs/batman_default_1550612196654_90183/Logs"
hardwareuuid="7a6fec6f-ace1-4d51-95ea-f3b20eacc5c7"
memory=4096
pagefusion="off"
vram=12
cpuexecutioncap=100
hpet="off"
chipset="piix3"
firmware="BIOS"
cpus=4
pae="on"
longmode="on"
triplefaultreset="off"
apic="on"
x2apic="off"
cpuid-portability-level=0
bootmenu="messageandmenu"
boot1="floppy"
boot2="dvd"
boot3="disk"
boot4="none"
acpi="on"
ioapic="on"
biosapic="apic"
biossystemtimeoffset=0
rtcuseutc="on"
hwvirtex="on"
nestedpaging="on"
largepages="off"
vtxvpid="on"
vtxux="on"
paravirtprovider="legacy"
effparavirtprovider="none"
VMState="running"
VMStateChangeTime="2019-02-20T05:37:26.672000000"
monitorcount=1
accelerate3d="off"
accelerate2dvideo="off"
teleporterenabled="off"
teleporterport=0
teleporteraddress=""
teleporterpassword=""
tracing-enabled="off"
tracing-allow-vm-access="off"
tracing-config=""
autostart-enabled="off"
autostart-delay=0
defaultfrontend=""
storagecontrollername0="SATA"
storagecontrollertype0="IntelAhci"
storagecontrollerinstance0="0"
storagecontrollermaxportcount0="30"
storagecontrollerportcount0="1"
storagecontrollerbootable0="on"
storagecontrollername1="IDE"
storagecontrollertype1="PIIX4"
storagecontrollerinstance1="0"
storagecontrollermaxportcount1="2"
storagecontrollerportcount1="2"
storagecontrollerbootable1="on"
"SATA-0-0"="/root/VirtualBox VMs/batman_default_1550612196654_90183/box-disk001.vmdk"
"SATA-ImageUUID-0-0"="7cb28ffd-8fb9-4440-8d50-627f0b3262e7"
"IDE-0-0"="none"
"IDE-0-1"="none"
"IDE-1-0"="emptydrive"
"IDE-IsEjected"="off"
"IDE-1-1"="none"
natnet1="nat"
macaddress1="080027465C5B"
cableconnected1="on"
nic1="nat"
nictype1="82540EM"
nicspeed1="0"
mtu="0"
sockSnd="64"
sockRcv="64"
tcpWndSnd="64"
tcpWndRcv="64"
Forwarding(0)="ssh,tcp,127.0.0.1,2222,,22"
nic2="none"
nic3="none"
nic4="none"
nic5="none"
nic6="none"
nic7="none"
nic8="none"
hidpointing="usbtablet"
hidkeyboard="ps2kbd"
uart1="off"
uart2="off"
uart3="off"
uart4="off"
lpt1="off"
lpt2="off"
audio="none"
audio_in="true"
audio_out="true"
clipboard="bidirectional"
draganddrop="bidirectional"
SessionName="headless"
VideoMode="720,400,0"@0,0 1
vrde="on"
vrdeport=-1
vrdeports="8000"
vrdeaddress=""
vrdeauthtype="null"
vrdemulticon="off"
vrdereusecon="off"
vrdevideochannel="off"
usb="on"
ehci="off"
xhci="off"
USBFilterActive1="on"
USBFilterName1="TDKMedia TF090 Drive [1100]"
USBFilterVendorId1="0718"
USBFilterProductId1="0703"
USBFilterRevision1="1100"
USBFilterManufacturer1="TDKMedia"
USBFilterProduct1="TF090 Drive"
USBFilterRemote1="0"
USBFilterSerialNumber1="1230000000001250"
USBFilterActive2="on"
USBFilterName2="Western Digital Elements 25A2 [1019]"
USBFilterVendorId2="1058"
USBFilterProductId2="25a2"
USBFilterRevision2="1019"
USBFilterManufacturer2="Western Digital"
USBFilterProduct2="Elements 25A2"
USBFilterRemote2="0"
USBFilterSerialNumber2="57584B3141333746594E3859"
SharedFolderNameMachineMapping1="root_Desktop_synced_data"
SharedFolderPathMachineMapping1="/root/batman/synced_data"
SharedFolderNameMachineMapping2="vagrant"
SharedFolderPathMachineMapping2="/root/batman"
VRDEActiveConnection="off"
VRDEClients=0
videocap="off"
videocap_audio="off"
videocapscreens=0
videocapfile="/root/VirtualBox VMs/batman_default_1550612196654_90183/batman_default_1550612196654_90183.webm"
videocapres=1024x768
videocaprate=512
videocapfps=25
videocapopts=
description="installed with:
CentOS-7.0-1406-x86_64-NetInstall.iso

CentOS 7 Gnome added with:

# yum groupinstall \"GNOME Desktop\" \"Graphical Administration Tools\"

user / password
-------------------

root / reverse
centos / reverse
"
GuestMemoryBalloon=0
GuestOSType="Linux26_64"
GuestAdditionsRunLevel=1
GuestAdditionsVersion="5.1.18 r114002"
GuestAdditionsFacility_VirtualBox Base Driver=50,1550641065785
GuestAdditionsFac
DEBUG subprocess: stdout: ility_Seamless Mode=0,1550641065784
GuestAdditionsFacility_Graphics Mode=0,1550641065784
DEBUG subprocess: Waiting for process to exit. Remaining to timeout: 32000
DEBUG subprocess: Exit status: 0
 INFO subprocess: Starting process: ["/usr/bin/VBoxManage", "showvminfo", "7a6fec6f-ace1-4d51-95ea-f3b20eacc5c7", "--machinereadable"]
 INFO subprocess: Vagrant not running in installer, restoring original environment...
DEBUG subprocess: Selecting on IO
DEBUG ssh: == Net-SSH connection debug-level log START ==
DEBUG ssh: D, [2019-02-20T02:37:42.067794 #10288] DEBUG -- net.ssh.transport.session[1259594]: establishing connection to 127.0.0.1:2222
D, [2019-02-20T02:37:42.067939 #10288] DEBUG -- net.ssh.transport.session[1259594]: connection established
I, [2019-02-20T02:37:42.067974 #10288]  INFO -- net.ssh.transport.server_version[1253914]: negotiating protocol version
D, [2019-02-20T02:37:42.067983 #10288] DEBUG -- net.ssh.transport.server_version[1253914]: local is `SSH-2.0-Ruby/Net::SSH_5.0.2 x86_64-linux'

DEBUG ssh: == Net-SSH connection debug-level log END ==
DEBUG subprocess: stdout: name="batman_default_1550612196654_90183"
groups="/"
ostype="Red Hat (64-bit)"
UUID="7a6fec6f-ace1-4d51-95ea-f3b20eacc5c7"
CfgFile="/root/VirtualBox VMs/batman_default_1550612196654_90183/batman_default_1550612196654_90183.vbox"
SnapFldr="/root/VirtualBox VMs/batman_default_1550612196654_90183/Snapshots"
LogFldr="/root/VirtualBox VMs/batman_default_1550612196654_90183/Logs"
hardwareuuid="7a6fec6f-ace1-4d51-95ea-f3b20eacc5c7"
memory=4096
pagefusion="off"
vram=12
cpuexecutioncap=100
hpet="off"
chipset="piix3"
firmware="BIOS"
cpus=4
pae="on"
longmode="on"
triplefaultreset="off"
apic="on"
x2apic="off"
cpuid-portability-level=0
bootmenu="messageandmenu"
boot1="floppy"
boot2="dvd"
boot3="disk"
boot4="none"
acpi="on"
ioapic="on"
biosapic="apic"
biossystemtimeoffset=0
rtcuseutc="on"
hwvirtex="on"
nestedpaging="on"
largepages="off"
vtxvpid="on"
vtxux="on"
paravirtprovider="legacy"
effparavirtprovider="none"
VMState="running"
VMStateChangeTime="2019-02-20T05:37:26.672000000"
monitorcount=1
accelerate3d="off"
accelerate2dvideo="off"
teleporterenabled="off"
teleporterport=0
teleporteraddress=""
teleporterpassword=""
tracing-enabled="off"
tracing-allow-vm-access="off"
tracing-config=""
autostart-enabled="off"
autostart-delay=0
defaultfrontend=""
storagecontrollername0="SATA"
storagecontrollertype0="IntelAhci"
storagecontrollerinstance0="0"
storagecontrollermaxportcount0="30"
storagecontrollerportcount0="1"
storagecontrollerbootable0="on"
storagecontrollername1="IDE"
storagecontrollertype1="PIIX4"
storagecontrollerinstance1="0"
storagecontrollermaxportcount1="2"
storagecontrollerportcount1="2"
storagecontrollerbootable1="on"
"SATA-0-0"="/root/VirtualBox VMs/batman_default_1550612196654_90183/box-disk001.vmdk"
"SATA-ImageUUID-0-0"="7cb28ffd-8fb9-4440-8d50-627f0b3262e7"
"IDE-0-0"="none"
"IDE-0-1"="none"
"IDE-1-0"="emptydrive"
"IDE-IsEjected"="off"
"IDE-1-1"="none"
natnet1="nat"
macaddress1="080027465C5B"
cableconnected1="on"
nic1="nat"
nictype1="82540EM"
nicspeed1="0"
mtu="0"
sockSnd="64"
sockRcv="64"
tcpWndSnd="64"
tcpWndRcv="64"
Forwarding(0)="ssh,tcp,127.0.0.1,2222,,22"
nic2="none"
nic3="none"
nic4="none"
nic5="none"
nic6="none"
nic7="none"
nic8="none"
hidpointing="usbtablet"
hidkeyboard="ps2kbd"
uart1="off"
uart2="off"
uart3="off"
uart4="off"
lpt1="off"
lpt2="off"
audio="none"
audio_in="true"
audio_out="true"
clipboard="bidirectional"
draganddrop="bidirectional"
SessionName="headless"
VideoMode="720,400,0"@0,0 1
vrde="on"
vrdeport=-1
vrdeports="8000"
vrdeaddress=""
vrdeauthtype="null"
vrdemulticon="off"
vrdereusecon="off"
vrdevideochannel="off"
usb="on"
ehci="off"
xhci="off"
USBFilterActive1="on"
USBFilterName1="TDKMedia TF090 Drive [1100]"
USBFilterVendorId1="0718"
USBFilterProductId1="0703"
USBFilterRevision1="1100"
USBFilterManufacturer1="TDKMedia"
USBFilterProduct1="TF090 Drive"
USBFilterRemote1="0"
USBFilterSerialNumber1="1230000000001250"
USBFilterActive2="on"
USBFilterName2="Western Digital Elements 25A2 [1019]"
USBFilterVendorId2="1058"
USBFilterProductId2="25a2"
USBFilterRevision2="1019"
USBFilterManufacturer2="Western Digital"
USBFilterProduct2="Elements 25A2"
USBFilterRemote2="0"
USBFilterSerialNumber2="57584B3141333746594E3859"
SharedFolderNameMachineMapping1="root_Desktop_synced_data"
SharedFolderPathMachineMapping1="/root/batman/synced_data"
SharedFolderNameMachineMapping2="vagrant"
SharedFolderPathMachineMapping2="/root/batman"
VRDEActiveConnection="off"
VRDEClients=0
videocap="off"
videocap_audio="off"
videocapscreens=0
videocapfile="/root/VirtualBox VMs/batman_default_1550612196654_90183/batman_default_1550612196654_90183.webm"
videocapres=1024x768
videocaprate=512
videocapfps=25
videocapopts=
description="installed with:
CentOS-7.0-1406-x86_64-NetInstall.iso

CentOS 7 Gnome added with:

# yum groupinstall \"GNOME Desktop\" \"Graphical Administration Tools\"

user / password
-------------------

root / reverse
centos / reverse
"
GuestMemoryBalloon=0
GuestOSType="Linux26_64"
GuestAdditionsRunLevel=1
GuestAdditionsVersion="5.1.18 r114002"
GuestAdditionsFacility_VirtualBox Base Driver=50,1550641065785
GuestAdditionsFac
DEBUG subprocess: stdout: ility_Seamless Mode=0,1550641065784
GuestAdditionsFacility_Graphics Mode=0,1550641065784
DEBUG subprocess: Waiting for process to exit. Remaining to timeout: 32000
DEBUG subprocess: Exit status: 0
ERROR warden: Error occurred: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
 INFO warden: Beginning recovery process...
 INFO warden: Calling recover: #<Vagrant::Action::Builtin::HandleForwardedPortCollisions:0x00000000015e4f60>
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
ERROR warden: Error occurred: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
ERROR warden: Error occurred: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
 INFO warden: Beginning recovery process...
 INFO warden: Calling recover: #<Vagrant::Action::Builtin::Call:0x0000000002e67d58>
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Recovery complete.
ERROR warden: Error occurred: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
ERROR warden: Error occurred: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
 INFO warden: Beginning recovery process...
 INFO warden: Calling recover: #<Vagrant::Action::Builtin::Call:0x0000000002fdd9a8>
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Recovery complete.
ERROR warden: Error occurred: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
ERROR warden: Error occurred: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
 INFO warden: Beginning recovery process...
 INFO warden: Calling recover: #<Vagrant::Action::Builtin::Call:0x0000000002f80550>
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Calling recover: #<Vagrant::Action::Builtin::Call:0x0000000003012388>
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Calling recover: #<Vagrant::Action::Builtin::Call:0x0000000003012400>
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
ERROR warden: Error occurred: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
ERROR warden: Error occurred: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
ERROR warden: Error occurred: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
ERROR warden: Error occurred: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO warden: Beginning recovery process...
 INFO warden: Recovery complete.
 INFO environment: Released process lock: machine-action-2e7db682bf90fc2f7983f89e2862f096
 INFO environment: Running hook: environment_unload
 INFO runner: Preparing hooks for middleware sequence...
 INFO runner: 3 hooks defined.
 INFO runner: Running action: environment_unload #<Vagrant::Action::Builder:0x0000000002da43d0>
ERROR vagrant: Vagrant experienced an error! Details:
ERROR vagrant: #<Vagrant::Errors::VMBootTimeout: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.>
ERROR vagrant: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
ERROR vagrant: /nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/wait_for_communicator.rb:62:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/customize.rb:40:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/boot.rb:18:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/customize.rb:40:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/sane_defaults.rb:38:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/set_hostname.rb:16:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/forward_ports.rb:31:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/network_fix_ipv6.rb:41:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/network.rb:123:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/clear_network_interfaces.rb:26:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/prepare_nfs_settings.rb:19:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/synced_folders.rb:87:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/synced_folder_cleanup.rb:28:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/synced_folders/nfs/action_cleanup.rb:25:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/prepare_nfs_valid_ids.rb:12:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/handle_forwarded_port_collisions.rb:49:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/prepare_forwarded_port_collision_params.rb:30:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/env_set.rb:19:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/provision.rb:80:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/clear_forwarded_ports.rb:15:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/set_name.rb:19:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/clean_machine_folder.rb:17:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/check_accessible.rb:18:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:95:in `block in finalize_action'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builder.rb:116:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/runner.rb:66:in `block in run'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/util/busy.rb:19:in `busy'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/runner.rb:66:in `run'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/call.rb:53:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:95:in `block in finalize_action'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builder.rb:116:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/runner.rb:66:in `block in run'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/util/busy.rb:19:in `busy'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/runner.rb:66:in `run'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/call.rb:53:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:95:in `block in finalize_action'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builder.rb:116:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/runner.rb:66:in `block in run'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/util/busy.rb:19:in `busy'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/runner.rb:66:in `run'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/call.rb:53:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/box_check_outdated.rb:82:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/config_validate.rb:25:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/check_virtualbox.rb:26:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:95:in `block in finalize_action'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:95:in `block in finalize_action'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builder.rb:116:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/runner.rb:66:in `block in run'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/util/busy.rb:19:in `busy'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/runner.rb:66:in `run'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/call.rb:53:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/config_validate.rb:25:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:95:in `block in finalize_action'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:95:in `block in finalize_action'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builder.rb:116:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/runner.rb:66:in `block in run'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/util/busy.rb:19:in `busy'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/runner.rb:66:in `run'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builtin/call.rb:53:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/plugins/providers/virtualbox/action/check_virtualbox.rb:26:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/warden.rb:34:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/builder.rb:116:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/runner.rb:66:in `block in run'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/util/busy.rb:19:in `busy'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/action/runner.rb:66:in `run'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/machine.rb:239:in `action_raw'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/machine.rb:208:in `block in action'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/environment.rb:614:in `lock'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/machine.rb:194:in `call'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/machine.rb:194:in `action'
/nix/store/pnp6aj2jrx3z65rrr27zxxfjw4crail5-vagrant-2.2.0/lib/ruby/gems/2.5.0/gems/vagrant-2.2.0/lib/vagrant/batch_action.rb:82:in `block (2 levels) in run'
 INFO interface: error: Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
Timed out while waiting for the machine to boot. This means that
Vagrant was unable to communicate with the guest machine within
the configured ("config.vm.boot_timeout" value) time period.

If you look above, you should be able to see the error(s) that
Vagrant had when attempting to connect to the machine. These errors
are usually good hints as to what may be wrong.

If you're using a custom box, make sure that networking is properly
working and you're able to connect to the machine. It is a common
problem that networking isn't setup properly in these boxes.
Verify that authentication configurations are also setup properly,
as well.

If the box appears to be booting properly, you may want to increase
the timeout ("config.vm.boot_timeout") value.
 INFO interface: Machine: error-exit ["Vagrant::Errors::VMBootTimeout", "Timed out while waiting for the machine to boot. This means that\nVagrant was unable to communicate with the guest machine within\nthe configured (\"config.vm.boot_timeout\" value) time period.\n\nIf you look above, you should be able to see the error(s) that\nVagrant had when attempting to connect to the machine. These errors\nare usually good hints as to what may be wrong.\n\nIf you're using a custom box, make sure that networking is properly\nworking and you're able to connect to the machine. It is a common\nproblem that networking isn't setup properly in these boxes.\nVerify that authentication configurations are also setup properly,\nas well.\n\nIf the box appears to be booting properly, you may want to increase\nthe timeout (\"config.vm.boot_timeout\") value."]
root@Bioinformatics:~/batman# 


```

## install virtualbox using nix 


```
nvim ~/.config/nixpkgs/config.nix

```


```
{ allowUnfree = true; }


```


```

nix-env -iA nixpkgs.virtualboxWithExtpack

```

## router ip

```

root@Bioinformatics:~# ip r
default via 192.168.0.1 dev enp4s0 proto dhcp metric 100 
169.254.0.0/16 dev enp4s0 scope link metric 1000 
192.168.0.0/24 dev enp4s0 proto kernel scope link src 192.168.0.104 metric 100
```

## router model

```
Roteador Wireless N 150M
Modelo TL-WR740N / TL-WR740ND
```

## router credentials 


```
admin
admin

```



## install neovim

nix-env -iA nixpkgs.nvim


## install ocaml



## Now we need to translate all the scala scripts into OCaml/Ruby and rely on nextflow


```
nix-env -iA nixpkgs.opam

opam init --disable-sandboxing

```

opam install utop
opam install base core 
opam install containers
opam install ctypes ctypes-foreign
opam install yojson
opam install tls ssl
opam install cohttp lwt
opam install lwt_ssl
opam install lambdasoup
opam install sqlite3
opam install qcheck
opam install alcotest
opam install shcaml
opam install genspio



## Setup python3Full using nix-env


## Setup miniconda3

```
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

chmod +x Miniconda3-latest-Linux-x86_64.sh

./Miniconda3-latest-Linux-x86_64.sh


```


## Setup the Xonsh shell

```
sudo apt install python3-pip
sudo apt-get install python3-setuptools
pip3 install xonsh

 NOTE: Unable to install pip3 using nix

```

```
pip3 install xonsh
```
