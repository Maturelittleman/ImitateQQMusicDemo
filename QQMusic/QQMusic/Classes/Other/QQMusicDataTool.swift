//
//  QQMusicDataTool.swift
//  QQMusic
//
//  Created by 仲琦 on 16/5/18.
//  Copyright © 2016年 仲琦. All rights reserved.
// 不要把获取数据的实现逻辑在控制器中写, 不利于维护和重用, 也不利于后期扩展

import UIKit

class QQMusicDataTool: NSObject {
    

    //这里利用闭包将数据传出, 因为后期改为异步从网络获取列表, 其他不可用
    class func getMusicData(result: (musicMs: [QQListModel]) -> ()) {
        
        //获取文件路径
        guard let path = NSBundle.mainBundle().pathForResource("Musics.plist", ofType: nil) else {
            result(musicMs: [QQListModel]())
            return
        }
        
        //取出文件中的数据
        guard let dictArray = NSArray(contentsOfFile: path) else {
            result(musicMs: [QQListModel]())
            return
        }
        
        //字典转模型
        var resultMs = [QQListModel]()
        for dict in dictArray {
            let MusicM = QQListModel(dict: dict as! [String: AnyObject])
            resultMs.append(MusicM)
        }
        
        //给出去
        result(musicMs: resultMs)
    }
}
