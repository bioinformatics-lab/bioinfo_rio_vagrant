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



# TODO  - install ncbi blast for v2.0.0

https://github.com/enormandeau/ncbi_blast_tutorial

Download link
```
ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.9.0+-x64-linux.tar.gz
```

setup commands
```

rclone copy onedrive-em:ncbi_blast_2.9.0_x64_linux.tar.gz ncbi_blast_2.9.0_x64_linux.tar.gz

tar -xvzf ncbi-blast-2.9.0+-x64-linux.tar.gz

cp -a ncbi-blast-2.9.0+ /opt/

# add this to the .bashrc
export PATH="/opt/ncbi-blast-2.9.0+/bin/":$PATH

```

# building a box from scratch
https://medium.com/@gajbhiyedeepanshu/building-custom-vagrant-box-e6a846b6baca
https://www.engineyard.com/blog/building-a-vagrant-box-from-start-to-finish
https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one

