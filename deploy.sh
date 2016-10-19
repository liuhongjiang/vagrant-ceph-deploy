#! /bin/env bash

mkdir my-cluster
cd my-cluster
ceph-deploy new mon1
echo "osd pool default size = 2" >> ceph.conf
echo "public network = 192.168.50.0/24" >> ceph.conf
ceph-deploy install deploy mon1 osd1 osd2
ceph-deploy mon create-initial

# fix deploy failed, refer to: ttp://tracker.ceph.com/issues/13833
ssh osd1 "sudo mkdir /var/local/osd0 && sudo chown ceph:ceph /var/local/osd0"
ssh osd2 "sudo mkdir /var/local/osd1 && sudo chown ceph:ceph /var/local/osd1"

ceph-deploy osd prepare osd1:/var/local/osd0 osd2:/var/local/osd1
ceph-deploy osd activate osd1:/var/local/osd0 osd2:/var/local/osd1

ceph-deploy admin deploy mon1 osd1 osd2
sudo chmod +r /etc/ceph/ceph.client.admin.keyring
ceph status
