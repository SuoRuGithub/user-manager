# user-manager

使用ansible实现对远程服务器的用户管理

## 添加新用户

准备表格，存放为`sheet`信息如下：

```
[student name], [ssh key]
```

运行``，将在20台服务器上添加账号，生成的文件中记录了生成账号的信息：

```
[host], [user name], [student name], 
```

## 删除指定用户

准备表格，信息如下：

```
[host], [user name]
```

运行``，将会删除对应用户.


## 目录组织结构：

