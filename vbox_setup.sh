
# so that we can install virtualbox via apt-get
for x in xenial xenial-security xenial-updates; do 
  egrep -qe "deb-src.* $x " /etc/apt/sources.list || echo "deb-src http://archive.ubuntu.com/ubuntu ${x} main universe" | sudo tee -a /etc/apt/sources.list
done
echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

# allow us to make a kernel
apt-get install unzip build-essential libssl-dev -y
arch="$(uname -m)"
release="$(uname -r)"
upstream="${release%%-*}"
local="${release#*-}"
echo $release
echo $local 
echo $upstream
mkdir -p /usr/src
wget -O "/usr/src/linux-${upstream}.tar.xz" "https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-${upstream}.tar.xz"
tar xf "/usr/src/linux-${upstream}.tar.xz" -C /usr/src/
ln -fns "/usr/src/linux-${upstream}" /usr/src/linux
ln -fns "/usr/src/linux-${upstream}" "/lib/modules/${release}/build"
zcat /proc/config.gz > /usr/src/linux/.config
printf 'CONFIG_LOCALVERSION="%s"\nCONFIG_CROSS_COMPILE=""\n' "${local:+-$local}" >> /usr/src/linux/.config
wget -O /usr/src/linux/Module.symvers "http://mirror.scaleway.com/kernel/${arch}/${release}/Module.symvers"

# make kernel (no idea why? but anyway)

NUM_CORES=$(cat /proc/cpuinfo|grep vendor_id|wc -l)
make -j${NUM_CORES} -C /usr/src/linux prepare modules_prepare
KDIR=/lib/modules/$(uname -r)/build/

# install virtualbox (which also does some kernel stuff)
apt-get install dkms virtualbox-5.2 -y
/sbin/rcvboxdrv setup
VBoxManage --version

wget http://download.virtualbox.org/virtualbox/5.2.0/Oracle_VM_VirtualBox_Extension_Pack-5.2.0-118431.vbox-extpack
VBoxManage extpack install ./Oracle_VM_VirtualBox_Extension_Pack-5.2.0-118431.vbox-extpack


# mound guest additions to guest
vboxmanage storageattach "IE9 - Win7" --storagectl "IDE" --port 1 --device 0 --type dvddrive --medium /usr/share/virtualbox/VBoxGuestAdditions.iso
