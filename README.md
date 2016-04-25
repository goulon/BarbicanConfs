# BarbicanConfs
Barbican configuration files repository for integration to OpenStack services

Check that conf files are consistent with those in this repo.

Run the keystone endpoint script to create one for the key manager.

Also, an SSH key might be useful for connection to the instance, so you might want to run the following command:

$ touch .ssh/id_rsa.pub
$ nova keypair-add --pub-key .ssh/id_rsa.pub admin

Finally, you can try to boot an encrypted server with the nova boot command. Don't forget to include the --key_name parameter.

= = = =

Security Group Update
$ nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
$ nova secgroup-add-rule default tcp 22 22

= = = =

Physical and Logcal Volumes creation

* Create empty files::
```bash
  dd if=/dev/zero of=lvmtest0.img bs=5000 count=1M
```
* Link to device::
```bash
  losetup /dev/loop0 lvmtest0.img
```
* Partition them (type n for new partition and enter default values without typing anything for the other parameters; save with w)::
```bash
  fdisk /dev/loop0
```
* Create physical volume::
```bash
  pvcreate /dev/loop0
```
* Create logical volume::
```bash
  vgcreate name-volume-group /dev/loop0
```
* Check your volumes with vgs and pvs commands
