//
//  ViewController.swift
//  Xcode正则
//
//  Created by 中发 on 2018/6/21.
//  Copyright © 2018年 中发. All rights reserved.
//
/**
 有关正则表达式的参考文档链接：http://deerchao.net/tutorials/regex/regex/htm
 */
import UIKit

/// 正则表达式
class ViewController: UIViewController {

    /**
     "(.*?)": UIColor\.(.*?)\[
     "$2": UIColor\.$2\[
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let arr = ["red": UIColor.red,
//                   "red": UIColor.orange,
//                   "red": UIColor.yellow,
//                   "red": UIColor.green,
//                   "red": UIColor.cyan,
//                   "red": UIColor.blue,
//                   "red": UIColor.purple]
//        print(arr)
        
        //1. <a href=\"http://app.weibo.com/t/feed/6vZb0\" rel=\"nofollow\">微博 weibo.com</a>
        //目标：取出href 中的链接，以及文本描述
        let string = "<a href=\"http://app.weibo.com/t/feed/6vZb0\" rel=\"nofollow\">微博 weibo.com</a>"
        //2.创建正则表达式
        //0> pattern - 常说的正则表达式，就是pattern的写法【匹配方案】
        //索引：
        //索引0:和匹配方案完全一致的字符串
        //索引1:第一个（）中的内容
        //索引2:第二个（）中的内容
        //...索引从左向右循环递增
        //
        //对于模糊匹配，如果关心的内容，就使用(.*?)，然后通过索引可以获取结果；如果不关心的内容，就是'.*?'，可以匹配任意的内容
        let pattern = "<a href=\"(.*?)\" .*?>(.*?)</a>"
        //1>创建正则表达式，如果pattern失败，抛出异常
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []) else {
            return
        }
        
        //2>进行查找，两种方法
        //【只找第一个匹配项/查找多个匹配项】
        guard let result = regx.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.characters.count)) else {
            print("没有找到匹配项")
            return
        }
        //3> result中只有两个重要的方法
        //result.numberOfRanges->查找到的范围数量
        //result.range(at: idx)->指定索引位置范围
        print("找到的数量\(result.numberOfRanges)")
        
        for idx in 0..<result.numberOfRanges {
            print(result.range(at: idx))
            let r = result.range(at: idx)
            let subStr = (string as NSString).substring(with: r)
            print("索引\(idx)---\(subStr)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

