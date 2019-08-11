# ITGE2017_RIO_vagrant
A vagrant version of the amazing ITGE2017 analysis machine




# Setup Instruction

# Digital Ocean
- Things work fine by default

# Scaleway
- Provider : Scaleway
- OS : Ubuntu Xenial 16.04 
- Architecture : x86_64

## Steps on Scaleway
- Build Kernel
- Setup virtualbox

## Step 3
- Setup nix pkg manager

## Step 4
- Install vagrant 

## Step 5
- Setup the ITGE2017 vagrant box




# TODO  - install ncbi blast for v2.0.0

https://github.com/enormandeau/ncbi_blast_tutorial

Download link
```
ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.9.0+-x64-linux.tar.gz
```

setup commands

- From Host
```
cd /biodragon/vagrantBox/

rclone copy onedrive-em:ncbi_blast_2.9.0_x64_linux.tar.gz ./

tar -xvzf ncbi_blast_2.9.0_x64_linux.tar.gz 

```
- From Guest

```
cd /vagrant/
sudo cp -a ncbi-blast-2.9.0+ /opt/
cp -a ncbi-blast-2.9.0+ /opt/

# add this to the .bashrc
export PATH="/opt/ncbi-blast-2.9.0+/bin/":$PATH

```
## SPOTYPING SETUP


https://github.com/xiaeryu/SpoTyping-v2.0

## RD ANALYZER SETUP

https://github.com/xiaeryu/RD-Analyzer


## KVARQ SETUP

- Inside the guest machine 

```sh
sudo yum install python-devel 
wget https://github.com/kvarq/kvarq/archive/master.zip
unzip master.zip
rm master.zip
cd kvarq-master
python setup.py test
sudo python setup.py install

```

## Change the default init directory to `/vagrant/` for the `vagrant ssh` in host.



# building a box from scratch
https://medium.com/@gajbhiyedeepanshu/building-custom-vagrant-box-e6a846b6baca

https://www.engineyard.com/blog/building-a-vagrant-box-from-start-to-finish

https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one


- Command to remove all the vagrant boxes 

```
vagrant box list | cut -f 1 -d ' ' | xargs -L 1 vagrant box remove -f

```
