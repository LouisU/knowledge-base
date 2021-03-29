Redis
--------

+ 高性能key-value服务器
+ 多种数据结构
+ 丰富的功能
+ 高可用分布式支持


## Redis初识
## API的理解和使用
## Redis客户端的使用
## 瑞士军刀Redis
## Redis持久化的取舍和选择
## Redis复制的原理和优化
## Redis Sentinel
## Redis Cluster
## 阿里云Redis开发规范


## Redis初识
+ Redis是什么？
    + 开源 C语言实现的
    + 基于键值对的存储服务系统
    + 多数据结构 字符串 哈希 列表 集合 有序集合 Bitmap geo
    + 性能高 功能丰富


+ Redis的特性
    + 速度快
        - 10w OPS 每秒10万次的读写  实际到达每秒万级别的读写
        - Redis中的数据都存在内存中 （这是Redis速度快的主要原因，下面的原因的原因对速度的提升可以忽略不计。）
        - C语言(5w行代码) 非常简洁 高效
        - 单线程 ？
    + 持久化
        - Redis所有的数据保存在内存中，对数据的更新将异步地保存到磁盘上。
    + 多种数据结构
        - 基础数据结构: 字符串 哈希 列表 集合 有序集合.  衍生以下几种数据结构
        - BitMaps 位图
        - HyperLogLog 超小内存唯一值计数  只用很小的内存保存计数
        - GEO 地理学信息定位 地图定位
    + 支持多种编程语言
        - Redis支持TCP协议 非常多的编程语言都能支持Redis, 比如Java Python Php Ruby Lua Node
    + 功能丰富
        - Lua脚本
        - 事务
        - 并发效率
        - 发布订阅
        - Pipline
    + 简单
        - 源代码简单 第一版5w行 
        - 不依赖外部库(安装特别简单) 
        - 单线程 
    + 主从复制 
    + 高可用 分布式
        - 高可用  Redis-Sentinel(v2.8) 支持高可用 
        - 分布式  Redis-Cluster(v3.0) 支持分布式 
+ Redis单机安装
    + 安装
    + Redis可执行文件说明
        + redis-server Redis服务器
        + redis-cli  Redis命令行客户端
        + redis-benchmark Redis性能测试工具 
        + redis-check-aof AOF文件修复工具 
        + redis-check-dump RDB文件检查工具 
        + redis-sentinel  Sentinel服务器(v2.8以后) 
+ Redis经典使用场景
    + 缓存系统
    + 计数器
    + 消息队列系统
    + 排行榜
    + 社交网络
    + 实时系统


