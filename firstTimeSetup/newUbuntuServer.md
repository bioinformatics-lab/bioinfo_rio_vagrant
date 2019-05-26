
```
apt update

apt install linux-headers-$(uname -r)

apt install virtualbox

apt install virtualbox-guest-utils

apt install vagrant 



```

# now move to the destination folder and start the vm 

```
mkdir -r /biodragon/vagrantBox
cd /biodragon/vagrantBox
wget ...
vagrant up
vagrant ssh
vagrant halt
```

# now change the file to access the machine with `ssh`

```
vagrant ssh
```
