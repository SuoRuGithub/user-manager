# user-manager

使用ansible实现对远程服务器的用户管理

## 得到用户信息

运行`./userManager.sh get`可以得到服务器的用户信息，用户信息将会存储在`.file/users_info.csv`中，文件内容示例如下：

```
hostname,username
accuracy,stu1
```

其中列出的账号都是创建并已分配ssh-key的学生账号，并且不包括stu0

在运行添加用户 / 删除用户程序之前和之后，都会自动从服务器更新用户信息

## 添加新用户

准备表格，存放为`./file/users_2_create.csv`文件内容示例如下：

```
studentname,sshkey
张思睿,ssh-rsa AAAAB3...
```

运行`./userManager.sh add`，将在20台服务器上添加账号，操作执行完成后将会在`./file/.archive`下输出一个`[datetime]-add.csv`文件，文件内容示例如下：

```
hostname,username,studentname,sshkey
accuracy,stu1,张思睿,ssh-rsa AAAAB3...
```

## 删除指定用户

准备表格，存放为`./file/users_2_delete.csv`文件内容示例如下：

```
hostname,username
accuracy,stu1
```

运行`./userManager.sh delete`，将会删除账号


## 目录组织结构：

```
.
├── file
│   └── README.md
├── inventory
│   └── inventory.yaml
├── playbooks
│   ├── create_users.yaml
│   ├── delete_users.yaml
│   ├── get_users_info.yaml
│   └── README.md
├── README.md
└── userManager.sh
```