# Vagrant init

```

cd /biodragon/vagrantBox

vagrant init abhi18av/ITGE2017_RIO \
  --box-version 0.0.1
vagrant up
```



# download the working Vagrantfile 

```
wget https://github.com/BioDragao/ITGE2017_RIO_vagrant/blob/master/firstTimeSetup/biodragon_Vagrantfile -o Vagrantfile

```

### In this file the following settings need to be noted
- login via `centos` always so that vagrant has a chance to setup the `ssh` keys
- increase the `wait_time` to around `600` minutes

- the installation of `vbguest` required me to login via the `root` user

# Now we run `vagrant up`


```
root@vaani /biodragon/vagrantBox/mozambique_genomes/lab master # vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Clearing any previously set forwarded ports...
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: root
    default: SSH auth method: password
    default: Warning: Connection reset. Retrying...
    default: Warning: Connection reset. Retrying...
    default: Warning: Connection reset. Retrying...
==> default: Machine booted and ready!
[default] GuestAdditions versions on your host (5.2.18) and guest (5.1.18) do not match.
Loaded plugins: fastestmirror, langpacks
Repodata is over 2 weeks old. Install yum-cron? Or run: yum makecache fast
Loading mirror speeds from cached hostfile
 * base: centos.mirrors.estointernet.in
 * epel: d2lzkl7pfhq30w.cloudfront.net
 * extras: centos.mirrors.estointernet.in
 * updates: centos.mirrors.estointernet.in
Package 1:make-3.82-23.el7.x86_64 already installed and latest version
Package bzip2-1.0.6-13.el7.x86_64 already installed and latest version
Resolving Dependencies
--> Running transaction check
---> Package binutils.x86_64 0:2.25.1-22.base.el7 will be updated
---> Package binutils.x86_64 0:2.27-34.base.el7 will be an update
---> Package gcc.x86_64 0:4.8.5-11.el7 will be updated
--> Processing Dependency: gcc = 4.8.5-11.el7 for package: gcc-gfortran-4.8.5-11.el7.x86_64
--> Processing Dependency: gcc = 4.8.5-11.el7 for package: gcc-c++-4.8.5-11.el7.x86_64
--> Processing Dependency: gcc = 4.8.5-11.el7 for package: libquadmath-devel-4.8.5-11.el7.x86_64
---> Package gcc.x86_64 0:4.8.5-36.el7_6.1 will be an update
--> Processing Dependency: libgomp = 4.8.5-36.el7_6.1 for package: gcc-4.8.5-36.el7_6.1.x86_64
--> Processing Dependency: cpp = 4.8.5-36.el7_6.1 for package: gcc-4.8.5-36.el7_6.1.x86_64
--> Processing Dependency: libgcc >= 4.8.5-36.el7_6.1 for package: gcc-4.8.5-36.el7_6.1.x86_64
---> Package kernel-devel.x86_64 0:3.10.0-957.10.1.el7 will be installed
---> Package perl.x86_64 4:5.16.3-291.el7 will be updated
---> Package perl.x86_64 4:5.16.3-294.el7_6 will be an update
--> Processing Dependency: perl-libs = 4:5.16.3-294.el7_6 for package: 4:perl-5.16.3-294.el7_6.x86_64
--> Running transaction check
---> Package cpp.x86_64 0:4.8.5-11.el7 will be updated
---> Package cpp.x86_64 0:4.8.5-36.el7_6.1 will be an update
---> Package gcc-c++.x86_64 0:4.8.5-11.el7 will be updated
---> Package gcc-c++.x86_64 0:4.8.5-36.el7_6.1 will be an update
--> Processing Dependency: libstdc++-devel = 4.8.5-36.el7_6.1 for package: gcc-c++-4.8.5-36.el7_6.1.x86_64
--> Processing Dependency: libstdc++ = 4.8.5-36.el7_6.1 for package: gcc-c++-4.8.5-36.el7_6.1.x86_64
---> Package gcc-gfortran.x86_64 0:4.8.5-11.el7 will be updated
---> Package gcc-gfortran.x86_64 0:4.8.5-36.el7_6.1 will be an update
--> Processing Dependency: libquadmath = 4.8.5-36.el7_6.1 for package: gcc-gfortran-4.8.5-36.el7_6.1.x86_64
--> Processing Dependency: libgfortran = 4.8.5-36.el7_6.1 for package: gcc-gfortran-4.8.5-36.el7_6.1.x86_64
---> Package libgcc.i686 0:4.8.5-11.el7 will be updated
---> Package libgcc.x86_64 0:4.8.5-11.el7 will be updated
---> Package libgcc.i686 0:4.8.5-36.el7_6.1 will be an update
---> Package libgcc.x86_64 0:4.8.5-36.el7_6.1 will be an update
---> Package libgomp.x86_64 0:4.8.5-11.el7 will be updated
---> Package libgomp.x86_64 0:4.8.5-36.el7_6.1 will be an update
---> Package libquadmath-devel.x86_64 0:4.8.5-11.el7 will be updated
---> Package libquadmath-devel.x86_64 0:4.8.5-36.el7_6.1 will be an update
---> Package perl-libs.x86_64 4:5.16.3-291.el7 will be updated
---> Package perl-libs.x86_64 4:5.16.3-294.el7_6 will be an update
--> Running transaction check
---> Package libgfortran.x86_64 0:4.8.5-11.el7 will be updated
---> Package libgfortran.x86_64 0:4.8.5-36.el7_6.1 will be an update
---> Package libquadmath.x86_64 0:4.8.5-11.el7 will be updated
---> Package libquadmath.x86_64 0:4.8.5-36.el7_6.1 will be an update
---> Package libstdc++.i686 0:4.8.5-11.el7 will be updated
---> Package libstdc++.x86_64 0:4.8.5-11.el7 will be updated
---> Package libstdc++.i686 0:4.8.5-36.el7_6.1 will be an update
---> Package libstdc++.x86_64 0:4.8.5-36.el7_6.1 will be an update
---> Package libstdc++-devel.x86_64 0:4.8.5-11.el7 will be updated
---> Package libstdc++-devel.x86_64 0:4.8.5-36.el7_6.1 will be an update
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                Arch        Version                  Repository    Size
================================================================================
Installing:
 kernel-devel           x86_64      3.10.0-957.10.1.el7      updates       17 M
Updating:
 binutils               x86_64      2.27-34.base.el7         base         5.9 M
 gcc                    x86_64      4.8.5-36.el7_6.1         updates       16 M
 perl                   x86_64      4:5.16.3-294.el7_6       updates      8.0 M
Updating for dependencies:
 cpp                    x86_64      4.8.5-36.el7_6.1         updates      5.9 M
 gcc-c++                x86_64      4.8.5-36.el7_6.1         updates      7.2 M
 gcc-gfortran           x86_64      4.8.5-36.el7_6.1         updates      6.7 M
 libgcc                 i686        4.8.5-36.el7_6.1         updates      109 k
 libgcc                 x86_64      4.8.5-36.el7_6.1         updates      102 k
 libgfortran            x86_64      4.8.5-36.el7_6.1         updates      300 k
 libgomp                x86_64      4.8.5-36.el7_6.1         updates      157 k
 libquadmath            x86_64      4.8.5-36.el7_6.1         updates      189 k
 libquadmath-devel      x86_64      4.8.5-36.el7_6.1         updates       52 k
 libstdc++              i686        4.8.5-36.el7_6.1         updates      318 k
 libstdc++              x86_64      4.8.5-36.el7_6.1         updates      305 k
 libstdc++-devel        x86_64      4.8.5-36.el7_6.1         updates      1.5 M
 perl-libs              x86_64      4:5.16.3-294.el7_6       updates      688 k

Transaction Summary
================================================================================
Install  1 Package
Upgrade  3 Packages (+13 Dependent packages)

Total download size: 70 M
Downloading packages:
No Presto metadata available for base
--------------------------------------------------------------------------------
Total                                              1.7 MB/s |  70 MB  00:42
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Updating   : libquadmath-4.8.5-36.el7_6.1.x86_64                         1/33
  Updating   : libgcc-4.8.5-36.el7_6.1.x86_64                              2/33
  Updating   : libstdc++-4.8.5-36.el7_6.1.x86_64                           3/33
  Updating   : libstdc++-devel-4.8.5-36.el7_6.1.x86_64                     4/33
  Updating   : libgfortran-4.8.5-36.el7_6.1.x86_64                         5/33
  Updating   : 4:perl-libs-5.16.3-294.el7_6.x86_64                         6/33
  Updating   : 4:perl-5.16.3-294.el7_6.x86_64                              7/33
  Updating   : binutils-2.27-34.base.el7.x86_64                            8/33
  Updating   : cpp-4.8.5-36.el7_6.1.x86_64                                 9/33
  Updating   : libgomp-4.8.5-36.el7_6.1.x86_64                            10/33
  Updating   : gcc-4.8.5-36.el7_6.1.x86_64                                11/33
  Updating   : libquadmath-devel-4.8.5-36.el7_6.1.x86_64                  12/33
  Updating   : libgcc-4.8.5-36.el7_6.1.i686                               13/33
  Updating   : gcc-gfortran-4.8.5-36.el7_6.1.x86_64                       14/33
  Updating   : gcc-c++-4.8.5-36.el7_6.1.x86_64                            15/33
  Installing : kernel-devel-3.10.0-957.10.1.el7.x86_64                    16/33
  Updating   : libstdc++-4.8.5-36.el7_6.1.i686                            17/33
  Cleanup    : gcc-c++-4.8.5-11.el7.x86_64                                18/33
  Cleanup    : gcc-gfortran-4.8.5-11.el7.x86_64                           19/33
  Cleanup    : libquadmath-devel-4.8.5-11.el7.x86_64                      20/33
  Cleanup    : libstdc++-devel-4.8.5-11.el7.x86_64                        21/33
  Cleanup    : libstdc++-4.8.5-11.el7                                     22/33
  Cleanup    : gcc-4.8.5-11.el7.x86_64                                    23/33
  Cleanup    : libgfortran-4.8.5-11.el7.x86_64                            24/33
  Cleanup    : binutils-2.25.1-22.base.el7.x86_64                         25/33
  Cleanup    : libstdc++-4.8.5-11.el7                                     26/33
  Cleanup    : 4:perl-5.16.3-291.el7.x86_64                               27/33
  Cleanup    : 4:perl-libs-5.16.3-291.el7.x86_64                          28/33
  Cleanup    : libgcc-4.8.5-11.el7                                        29/33
  Cleanup    : libgcc-4.8.5-11.el7                                        30/33
  Cleanup    : libquadmath-4.8.5-11.el7.x86_64                            31/33
  Cleanup    : cpp-4.8.5-11.el7.x86_64                                    32/33
  Cleanup    : libgomp-4.8.5-11.el7.x86_64                                33/33
  Verifying  : gcc-gfortran-4.8.5-36.el7_6.1.x86_64                        1/33
  Verifying  : libgomp-4.8.5-36.el7_6.1.x86_64                             2/33
  Verifying  : libgcc-4.8.5-36.el7_6.1.x86_64                              3/33
  Verifying  : libstdc++-devel-4.8.5-36.el7_6.1.x86_64                     4/33
  Verifying  : cpp-4.8.5-36.el7_6.1.x86_64                                 5/33
  Verifying  : libquadmath-devel-4.8.5-36.el7_6.1.x86_64                   6/33
  Verifying  : libquadmath-4.8.5-36.el7_6.1.x86_64                         7/33
  Verifying  : libgcc-4.8.5-36.el7_6.1.i686                                8/33
  Verifying  : 4:perl-libs-5.16.3-294.el7_6.x86_64                         9/33
  Verifying  : binutils-2.27-34.base.el7.x86_64                           10/33
  Verifying  : kernel-devel-3.10.0-957.10.1.el7.x86_64                    11/33
  Verifying  : 4:perl-5.16.3-294.el7_6.x86_64                             12/33
  Verifying  : libstdc++-4.8.5-36.el7_6.1.x86_64                          13/33
  Verifying  : libgfortran-4.8.5-36.el7_6.1.x86_64                        14/33
  Verifying  : libstdc++-4.8.5-36.el7_6.1.i686                            15/33
  Verifying  : gcc-4.8.5-36.el7_6.1.x86_64                                16/33
  Verifying  : gcc-c++-4.8.5-36.el7_6.1.x86_64                            17/33
  Verifying  : gcc-c++-4.8.5-11.el7.x86_64                                18/33
  Verifying  : libquadmath-4.8.5-11.el7.x86_64                            19/33
  Verifying  : cpp-4.8.5-11.el7.x86_64                                    20/33
  Verifying  : libgcc-4.8.5-11.el7.i686                                   21/33
  Verifying  : binutils-2.25.1-22.base.el7.x86_64                         22/33
  Verifying  : libgfortran-4.8.5-11.el7.x86_64                            23/33
  Verifying  : libquadmath-devel-4.8.5-11.el7.x86_64                      24/33
  Verifying  : libgcc-4.8.5-11.el7.x86_64                                 25/33
  Verifying  : 4:perl-libs-5.16.3-291.el7.x86_64                          26/33
  Verifying  : libstdc++-4.8.5-11.el7.x86_64                              27/33
  Verifying  : 4:perl-5.16.3-291.el7.x86_64                               28/33
  Verifying  : gcc-gfortran-4.8.5-11.el7.x86_64                           29/33
  Verifying  : libstdc++-4.8.5-11.el7.i686                                30/33
  Verifying  : libgomp-4.8.5-11.el7.x86_64                                31/33
  Verifying  : gcc-4.8.5-11.el7.x86_64                                    32/33
  Verifying  : libstdc++-devel-4.8.5-11.el7.x86_64                        33/33

Installed:
  kernel-devel.x86_64 0:3.10.0-957.10.1.el7

Updated:
  binutils.x86_64 0:2.27-34.base.el7        gcc.x86_64 0:4.8.5-36.el7_6.1
  perl.x86_64 4:5.16.3-294.el7_6

Dependency Updated:
  cpp.x86_64 0:4.8.5-36.el7_6.1
  gcc-c++.x86_64 0:4.8.5-36.el7_6.1
  gcc-gfortran.x86_64 0:4.8.5-36.el7_6.1
  libgcc.i686 0:4.8.5-36.el7_6.1
  libgcc.x86_64 0:4.8.5-36.el7_6.1
  libgfortran.x86_64 0:4.8.5-36.el7_6.1
  libgomp.x86_64 0:4.8.5-36.el7_6.1
  libquadmath.x86_64 0:4.8.5-36.el7_6.1
  libquadmath-devel.x86_64 0:4.8.5-36.el7_6.1
  libstdc++.i686 0:4.8.5-36.el7_6.1
  libstdc++.x86_64 0:4.8.5-36.el7_6.1
  libstdc++-devel.x86_64 0:4.8.5-36.el7_6.1
  perl-libs.x86_64 4:5.16.3-294.el7_6

Complete!
Downloading VirtualBox Guest Additions ISO from http://download.virtualbox.org/virtualbox/5.2.18/VBoxGuestAdditions_5.2.18.iso
Copy iso file /root/.vagrant.d/tmp/VBoxGuestAdditions_5.2.18.iso into the box /tmp/VBoxGuestAdditions.iso
Mounting Virtualbox Guest Additions ISO to: /mnt
mount: /dev/loop0 is write-protected, mounting read-only
Installing Virtualbox Guest Additions 5.2.18 - guest version is 5.1.18
Verifying archive integrity... All good.
Uncompressing VirtualBox 5.2.18 Guest Additions for Linux........
VirtualBox Guest Additions installer
Removing installed version 5.1.18 of VirtualBox Guest Additions...
Copying additional installer modules ...
Installing additional modules ...
VirtualBox Guest Additions: Building the VirtualBox Guest Additions kernel modules.  This may take a while.
VirtualBox Guest Additions: Running kernel modules will not be replaced until the system is restarted
VirtualBox Guest Additions: Starting.
VirtualBox Guest Additions: modprobe vboxsf failed
An error occurred during installation of VirtualBox Guest Additions 5.2.18. Some functionality may not work as intended.
In most cases it is OK that the "Window System drivers" installation failed.
Redirecting to /bin/systemctl start  vboxadd.service
Redirecting to /bin/systemctl start  vboxadd-service.service
Job for vboxadd-service.service failed because the control process exited with error code. See "systemctl status vboxadd-service.service" and "journalctl -xe" for details.
Unmounting Virtualbox Guest Additions ISO from: /mnt
Cleaning up downloaded VirtualBox Guest Additions ISO...
==> default: Checking for guest additions in VM...
    default: The guest additions on this VM do not match the installed version of
    default: VirtualBox! In most cases this is fine, but in rare cases it can
    default: prevent things such as shared folders from working properly. If you see
    default: shared folder errors, please make sure the guest additions within the
    default: virtual machine match the version of VirtualBox you have installed on
    default: your host and reload your VM.
    default:
    default: Guest Additions Version: 5.1.18
    default: VirtualBox Version: 5.2
==> default: Mounting shared folders...
    default: /vagrant => /biodragon/vagrantBox
Vagrant was unable to mount VirtualBox shared folders. This is usually
because the filesystem "vboxsf" is not available. This filesystem is
made available via the VirtualBox Guest Additions and kernel module.
Please verify that these guest additions are properly installed in the
guest. This is not a bug in Vagrant and is usually caused by a faulty
Vagrant box. For context, the command attempted was:

mount -t vboxsf -o uid=0,gid=0 vagrant /vagrant

The error output from the command was:

/sbin/mount.vboxsf: mounting failed with the error: No such device
```


- The `vbguest installation process` will fail as shown above.

## vagrant halt 

## vagrant up

```
root@vaani /biodragon/vagrantBox master # vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Clearing any previously set forwarded ports...
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: root
    default: SSH auth method: password
    default: Warning: Connection reset. Retrying...
    default: Warning: Connection reset. Retrying...
    default: Warning: Connection reset. Retrying...
    default: Warning: Connection reset. Retrying...
==> default: Machine booted and ready!
[default] GuestAdditions 5.2.18 running --- OK.
==> default: Checking for guest additions in VM...
==> default: Mounting shared folders...
    default: /vagrant => /biodragon/vagrantBox
 

```


## now I can login and use the installed `vbguest` using `/vagrant` 

