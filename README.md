# ITGE2017_RIO_vagrant
A vagrant version of the amazing ITGE2017 analysis machine

# Setup Instruction

- Provider : Scaleway
- OS : Ubuntu Xenial 16.04 
- Architecture : x86_64

## Step 1
- Build Kernel

## Step 2
- Setup virtualbox

## Step 3
- Setup nix pkg manager

## Step 4
- Install vagrant 

## Step 5
- Setup the ITGE2017 vagrant box



# TODO  - install ncbi blast

https://github.com/enormandeau/ncbi_blast_tutorial


```
cp -a ncbi-blast-2.9.0+ /opt/
export PATH="/opt/ncbi-blast-2.9.0+/bin/":$PATH
```

## TODO - i must make sure that I execute all the commands as a `centos` user 


## maybe I could just completely elevate the `centos` user as `root`
https://www.shellhacks.com/how-to-grant-root-access-user-root-privileges-linux/

```
[centos@localhost vagrant]$ grep centos /etc/passwd
centos:x:1000:1000:centos:/home/centos:/bin/bash
```

# tried deleting the password for elevated `centos`
https://www.cyberciti.biz/faq/linux-delete-user-password/

# building a box from scratch
https://medium.com/@gajbhiyedeepanshu/building-custom-vagrant-box-e6a846b6baca
https://www.engineyard.com/blog/building-a-vagrant-box-from-start-to-finish
https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one

