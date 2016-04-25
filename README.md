# BarbicanConfs
Barbican configuration files repository for integration to OpenStack services

Check that conf files are consistent with those in this repo.

Run the keystone endpoint script to create one for the key manager.

Also, an SSH key might be useful for connection to the instance, so you might want to run the following command:

$ touch .ssh/id_rsa.pub
$ nova keypair-add --pub-key .ssh/id_rsa.pub admin

Finally, you can try to boot an encrypted server with the nova boot command. Don't forget to include the --key_name parameter.
