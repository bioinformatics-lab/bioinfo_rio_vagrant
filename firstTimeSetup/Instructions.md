Here is the series of steps I've followed to setup `ITGE2017` vagrant image in `Vaani` server.

- Always prefer using the `centos` as the ssh user


- Install guest addition on host 
https://linuxconfig.org/install-virtualbox-on-ubuntu-18-04-bionic-beaver-linux

```sh


```


```sh


root@vaani /biodragon # vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'abhi18av/ITGE2017_RIO'...
==> default: Matching MAC address for NAT networking...
==> default: Setting the name of the VM: biodragon_default_1554539849953_50807
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
root@vaani /biodragon #
root@vaani /biodragon #
root@vaani /biodragon # vagrant ssh
==> default: The machine you're attempting to SSH into is configured to use
==> default: password-based authentication. Vagrant can't script entering the
==> default: password for you. If you're prompted for a password, please enter
==> default: the same password you have configured in the Vagrantfile.
root@127.0.0.1's password:
Last login: Fri Sep 15 02:55:48 2017
ABRT has detected 3 problem(s). For more info run: abrt-cli list --since 1505440548
[root@localhost ~]#
[root@localhost ~]# exit
logout
Connection to 127.0.0.1 closed.


root@vaani /biodragon # vagrant halt
==> default: Attempting graceful shutdown of VM...
    default:
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Forcing shutdown of VM... 

```

# Shared folder permission

https://superuser.com/questions/307853/permission-denied-when-accessing-virtualbox-shared-folder-when-member-of-the-vbo

