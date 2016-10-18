#! /bin/env bash

sudo yum install -y yum-utils \
    && sudo yum-config-manager --add-repo https://dl.fedoraproject.org/pub/epel/7/x86_64/ \
    && sudo yum install --nogpgcheck -y epel-release \
    && sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 \
    && sudo rm /etc/yum.repos.d/dl.fedoraproject.org*

sudo cat <<heredoc > /etc/yum.repos.d/ceph-deploy.repo
[ceph-noarch]
name=Ceph noarch packages
baseurl=http://download.ceph.com/rpm-infernalis/el7/noarch
enabled=1
gpgcheck=1
type=rpm-md
gpgkey=https://download.ceph.com/keys/release.asc
heredoc

sudo yum update -y && sudo yum install -y ceph-deploy
sudo yum install -y ntp ntpdate ntp-doc
sudo yum install -y openssh-server

flag=`grep "mon1" /etc/hosts | wc -l`

if [ $flag -eq 0 ]
then
sudo cat <<hostsdoc >> /etc/hosts
192.168.50.4    deploy
192.168.50.11    mon1
192.168.50.21    osd1
192.168.50.22    osd2
hostsdoc
fi

sudo sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config

sudo service sshd restart

sudo setenforce 0
sudo yum install yum-plugin-priorities -y
sudo systemctl stop firewalld
sudo systemctl disable firewalld


#ssh-keygen -q
#spawn ssh-copy-id vagrant@mon1
#match_max 1000000
#expect "*?(yes/no)?*"
#send -- "yes\r"
#expect "*?assword:*"
#send -- "vagrant\r"
#send -- "\r"
#
#spawn ssh-copy-id vagrant@osd1
#match_max 1000000
#expect "*?(yes/no)?*"
#send -- "yes\r"
#expect "*?assword:*"
#send -- "vagrant\r"
#send -- "\r"
#
#spawn ssh-copy-id vagrant@osd2
#match_max 1000000
#expect "*?(yes/no)?*"
#send -- "yes\r"
#expect "*?assword:*"
#send -- "vagrant\r"
#send -- "\r"
