//
//  TinySouClient.swift
//  TinySouSwift
//
//  Created by Yeming Wang on 14-10-27.
//  Copyright (c) 2014年 tinysou. All rights reserved.
//  Code-style: The Official raywenderlich.com Swift Style Guide.
//

import Foundation

@objc public class TinySouClient: NSObject{
  private var engine_key: String!  //设置engine_key
  private var method: String = "POST"  //http请求方法
  private var search_url: String = "http://api.tinysou.com/v1/public/search"  //搜索url
  private var ac_url: String = "http://api.tinysou.com/v1/public/autocomplete"  //自动补全url
  private var page: Int = 0  //显示的页数
  private var is_error: Bool = false  //状态判断
  private var per_page: Int = 10  //每页显示的页数
  private var error_message: String?  //error信息
  private var search_params: [String: AnyObject]!  //搜索请求的parmas
  private var ac_params: [String: AnyObject]!  //自动补全请求的parmas
  
  //初始化函数
  public init(engine_key: String){
    self.engine_key = engine_key
  }
  
  //设置搜索页数
  public func setPage(page: Int){
    self.page = page
  }
  
  //获取搜索页数
  public func getPage() ->Int{
    return self.page
  }
  
  //设置每页显示的页数
  public func setPerPage(per_page: Int){
    self.per_page = per_page
  }
  
  //获取每页显示的页数
  public func getPerPage() ->Int{
    return self.per_page
  }
  
  //获取搜索url
  public func getSearchUrl() ->String{
    return self.search_url
  }
  
  //获取自动补全url
  public func getAcUrl() ->String{
    return self.ac_url
  }
  
  //判断是否出错
  public func isError() ->Bool{
    return self.is_error
  }
  
  //设置请求参数
  public func setSearchParams(params: [String: AnyObject]) {
    search_params = params
  }
  
  //获取请求参数
  public func getSearchParams() -> [String: AnyObject] {
    return search_params
  }
  
  //设置自动补全参数
  public func setAcParams(params: [String: AnyObject]) {
    ac_params = params
  }
  
  //获取自动补全参数
  public func getAcParams() -> [String: AnyObject] {
    return ac_params
  }
  
  //新建搜索request
  public func buildRequest(search_content: String) -> NSURLRequest {
    var url = NSURL(string: search_url)
    //新建request
    var request = NSMutableURLRequest(URL: url!)
    //设置请求方法
    request.HTTPMethod = self.method
    //定义报错
    var err: NSError?
    //设置header
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //设置body
    if search_params == nil {
      search_params = ["q": search_content, "c": "page", "page": page, "engine_key": engine_key, "per_page": per_page]
    }
    setSearchParams(search_params)
    request.HTTPBody = NSJSONSerialization.dataWithJSONObject(search_params, options: nil, error: &err)
    return request
  }
  
  //新建自动补全request
  public func buildAcRequest(search_content: String) -> NSURLRequest {
    var url = NSURL(string: ac_url)
    //新建request
    var request = NSMutableURLRequest(URL: url!)
    //设置请求方法
    request.HTTPMethod = self.method
    //定义报错
    var err: NSError?
    //设置header
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    var fetch_field: Array = ["title", "sections", "url", "updated_at"]
    //设置body
    if ac_params == nil {
      ac_params = ["q": search_content, "c": "page",  "engine_key": engine_key, "per_page": per_page, "fetch_fields": fetch_field] as [String: AnyObject]
    }
    setAcParams(ac_params)
    request.HTTPBody = NSJSONSerialization.dataWithJSONObject(ac_params, options: nil, error: &err)
    return request
  }
  
}
