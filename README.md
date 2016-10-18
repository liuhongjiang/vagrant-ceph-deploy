1. 创建可以ssh的账号，由于我们使用的是vagrant，所有不需要再创建
2. ssh的账号，通过ssh-config配置，但是我们这里都是用的是vagrant的所有不需要在配置

steps:

1. vagrant up

2. copy ssh id
```
vagrant ssh deplopy
ssh-keygen
ssh-copy-id mon1  # password is vagrant
ssh-copy-id osd1
ssh-copy-id osd2
```

3. run ceph-deploy

```
vagrant ssh deploy
sh -x deploy.sh
```
