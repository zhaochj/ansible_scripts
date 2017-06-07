# ansible_scripts

ansible playbooks实现系统初始化及常见应用环境的自动部署和配置。


playbooks中所涉及的各应用的压缩包部署在nginx的root目录里，涉及的nginx配置如下：

```
.....

http {
    autoindex on; #自动显示目录
    autoindex_exact_size off; #人性化方式显示文件大小，否则以字节显示
    autoindex_localtime on; #按服务器时间显示，否则以GMT时间显示


    server {
        listen   80;
        server_name localhost;
        root /ftproot/files;
        autoindex on;
        autoindex_exact_size off;
        autoindex_localtime on;
    }
}
```

nginx的root目录结构如下：

```sh
ansible@ansible-01:/ftproot/files$ pwd
/ftproot/files
ansible@ansible-01:/ftproot/files$ tree .
.
├── common
│   └── sources.list
├── jdk
│   ├── jdk1.7.60.tgz
│   └── jdk1.8.0_65.tgz
├── kafka
│   ├── kafka_2.10-0.10.0.0.tgz
│   └── kafka_2.10-0.9.0.1.tgz
├── nginx
│   └── nginx18.tar.gz
├── node
│   └── node-v6.5.0-linux-x64_install-pm2.tar.gz
├── pyenv
│   └── pyenv.tgz
├── README.md
├── tomcat
│   ├── tomcat-7.0.54.tgz
│   └── tomcat-7.0.65.tgz
├── zabbix
│   └── zabbix-agentd_2.4.5-1+wheezy_amd64.deb
└── zookeeper
    └── zookeeper-3.4.6.tgz

9 directories, 13 files
```

所涉及的包存放在`ftproot_files`目录下。
