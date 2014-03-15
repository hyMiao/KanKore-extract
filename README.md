# KanKore立绘提取工具 #

**KanKore-extract**是一个用ruby写的小工具，用于提取舰娘立绘。
本工具利用ruby实现对于立绘的下载管理，立绘的提取则是通过**swftools**中的__swfextract__进行的。

>关于swftools，请看[http://www.swftools.org/][refer1_swftools]

## 开发环境&&使用环境 ##

- CentOS（Linux环境）
- Ruby2.1.0
- rake
- swfextract(已编译提供)

## 使用方法 ##

基本功能：更新舰娘立绘，查询已有立绘，移除

### 更新 ###

- 更新全部本地不存在的舰娘立绘

    >检索本地已有的舰娘立绘文件，从服务器端获取本地不存在的文件进行提取

	在Rakefile所在目录下执行： `rake`

    或者执行： `rake update:new` 即可


- 更新某一特定id舰娘立绘

    >根据用户提供的舰娘id进行特定的更新，更适用于立绘修改的情况

    在Rakefile所在目录下执行：
    
    `rake update:one[ship_id]`

    **ship_id**填写想要更新的舰娘的**id**即可

- 更新全部舰娘立绘
    
    >不区分是否为新加入，包括本地已有的立绘全部强制更新
    
    在Rakefile所在目录下执行：

    `rake update:all` 即可


### 查询 ###
现阶段未添加该功能

### 移除 ###
现阶段未添加该功能

## 许可 ##

本软件包遵循GPLv2许可

[refer1_swftools]:http://www.swftools.org/

