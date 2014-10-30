tinysou-swift
=============
想要在项目中学习，查看demo

##介绍
微搜索ios-swift-library，通过调用public接口，实现新建微搜索请求、处理微搜索响应等功能。目前支持的接口有：
* 搜索API
* 自动补全API

tinysou-swift是一个 Cocoa Touch Framework，你可以直接使用， git clone 后，添加项目到 Workspace ，建立依赖关系即可。

## 如何使用
想要使用tinysou-swift-library，有两种办法：
* 使用Project：将TinySouClient.swift直接导入到你的ios项目中
* 使用Workspace：将library项目添加到Workspace, 为 App 添加依赖。具体用法如下：

1. 创建 Workspace，用来管理我们的项目及其依赖的第三方库（已有Workspace的可以略过这一步），将App和library都加入同一工作目录中
![Image text](https://github.com/wangyeming/tinysou-swift/blob/master/Pic/%E4%BB%8B%E7%BB%8D%E5%9B%BE%E7%89%871.png)
2. 为 App 添加依赖。在你的App的 Genral 选项卡中，添加 Linked Frameworks and Libraries，选择 Workspace 中 TinySouClient的.framework文件。
![Image text](https://github.com/wangyeming/tinysou-swift/blob/master/Pic/%E4%BB%8B%E7%BB%8D%E5%9B%BE%E7%89%872.png)
3. 可以在 DemoApp 项目代码中  ``` import TinySouClinet ```来使用我们的库

## 如何在应用中进行微搜索
* 设置engine_key
``` swift
      let engine_key: String = "示例key" 
```
* 建立微搜索/自动补全请求
``` swift
      //初始化
      var tinySouClient = TinySouClient(engine_key: engine_key) 
      //设置搜索结果显示的页数
      tinySouClient.setPage(page)
      //新建搜索请求 search_content为待搜索内容
      var request = tinySouClient.buildRequest(search_content)
      //新建自动补全请求
      var ac_request = tinySouClient.buildAcRequest(search_content)
      //...发送请求（略）推荐采用NSURLSession
      //...处理响应结果 (略) 推荐使用SwiftyJSON
```
