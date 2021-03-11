# 初始安装TrueNAS后的基本设置



### 设置时区

```shell
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
adjkerntz -a 
date
```

### 开启root用户的ssh登录，配置ssh免密码登录

这个貌似只能在GUI模式下或者本地登录才能修改了，本地登录后，开启sshd服务

```shell
nano /etc/rc.conf
```

```shell
sshd_enable="YES"
```

```shell
/etc/rc.d/sshd start
```

配置sshd服务，开启root登录，配置免密码登录

```shell
nano /etc/sshd_config
```

```shell
PermitRootLogin yes				#开启root登录权限
PubkeyAuthentication yes		#开启秘钥登录
PermitEmptyPasswords no			#禁用空密码
PasswordAuthentication yes		#允许密码登录
```

客户机上传公钥

```
ssh-copy-id -i id_rsa.pub root@192.168.2.101	
#秘钥是成对的，本地 ~/.ssh下要有对应的私钥
```

生成秘钥对

```
gs@GS-PC:~$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/gs/.ssh/id_rsa): new_id_rsa
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in new_id_rsa.
Your public key has been saved in new_id_rsa.pub.
The key fingerprint is:
SHA256:1N8AaxePwhMCw+qlM2dwDtLzKA7ZYX0ZV+ZOQBl6uLU gs@GS-PC
The key's randomart image is:
+---[RSA 2048]----+
|     .oo=+= .    |
|      o+oB + +   |
|   o .o++ X + .  |
|  + B == = = o   |
| + + %. E . . .  |
|o o * =          |
| o . =           |
|  .              |
|                 |
+----[SHA256]-----+
```



### 修改pkg源

```bash
mkdir -p /usr/local/etc/pkg/repos
vi /usr/local/etc/pkg/repos/ustc.conf

ustc: {
url: "pkg+http://mirrors.ustc.edu.cn/freebsd-pkg/${ABI}/latest",
mirror_type: "srv",
signature_type: "none",
fingerprints: "/usr/share/keys/pkg",
enabled: yes
}


 mv /etc/pkg/FreeBSD.conf /etc/pkg/FreeBSD.conf.back
 
 
 pkg -f update
```

会有报错

```shell
Unable to update repository local
Error updating repositories!
```

原因在于TrueNAS（FreeNas）的关于本地缓存的配置与FreeBSD不同，TrueNAS（FreeNas）是关闭的，FreeBSD是打开的。

```shell
nano /usr/local/etc/pkg/repos/local.conf	#yes改no
nano /usr/local/etc/pkg/repos/FreeBSD.conf	#no改yes
pkg upgrade	#将近2G的升级
```





