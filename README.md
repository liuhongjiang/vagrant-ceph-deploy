This repository is used for deploy a developing environment of ceph.

Four vms will be created, deploy node is ceph-deploy node, mon1 is the monitor node. osd1 and osd2 are osd nodes.

## How to setup

To setup this environment, virtualbox should be installed on the machine.

1. run `vagrant up`

2. login deploy vm and run deploy script

```
vagrant ssh deploy
sh -x deploy.sh
```

## vms

deploy is the vm node which the ceph deployment runs on.

and mon1 is the ceph monitor node.

osd1 and osd2 will run the osd process, and the directory for osd is: `osd1:/var/local/osd0 osd2:/var/local/osd1`.
 
The ceph admin will run on `deploy/mon1/osd1/osd2`, you can input the `ceph status` and `ceph health` to check.

## What's missing

From the ceph-deploy manual, the following should be done:
1. you need to create new user to deploy ceph
2. and the public key of deploy node should be add to the monitor and osd node, so user can login to monitor and osd node from deploy node with the private key
3. add ssh-config on the deploy node, like [this](http://docs.ceph.com/docs/master/start/quick-start-preflight/#enable-password-less-ssh), so when ssh to other node, we don't need to specify the username.

But in our deploy process, the first point is the `vagrant` user is already created by the vagrant.

as the username are the same, so point 3 is unncessary.
