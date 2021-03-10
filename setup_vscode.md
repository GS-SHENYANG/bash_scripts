# remote-ssh

    Remote-SSH只提供使用RSA秘钥远程登录，所以你必须将该本机的rsa公钥添加到远程服务器，这一步并不麻烦，可以看我的这篇博文https://blog.csdn.net/sixdaycoder/article/details/89850064有详细教程。
    Remote-SSH非常简单。首先使用快捷键Ctrl+P打开活动栏：搜索Remote-SSH,点选Connect to Host选项
    接着会弹出：让你选择config文件放在哪里，回车即可新建并编辑config文件。
    config文件必须放到被授权的rsa秘钥所在的文件目录，config文件是Remote-SSH的配置文件，表示我们将使用这个文件夹下的rsa秘钥文件去登录远程服务器。


# 命令替换

    提取命令输出值 要用反引号字符（`）
    这个不是英文上逗号，是在键盘最左上角，数字1左边的(`)


# date命令用法


    [root@truenas ~]# echo `date`
    Wed Mar 10 23:13:24 CST 2021
    [root@truenas ~]# echo `date`.log
    Wed Mar 10 23:13:36 CST 2021.log
    [root@truenas ~]# date +%y%m%d
    210310
    [root@truenas ~]# filename=`date +%F-%H-%M-%S`
    [root@truenas ~]# echo $filename
    2021-03-10-23-11-09
    [root@truenas ~]# echo $filename.
    2021-03-10-23-11-09.
    [root@truenas ~]# echo $filename.ba
    2021-03-10-23-11-09.ba
    [root@truenas ~]# echo $filename.log
    2021-03-10-23-11-09.log

    
