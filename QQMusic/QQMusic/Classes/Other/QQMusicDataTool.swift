//
//  QQMusicDataTool.swift
//  QQMusic
//
//  Created by 仲琦 on 16/5/18.
//  Copyright © 2016年 仲琦. All rights reserved.
//

import UIKit

class QQMusicDataTool: NSObject {
    

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
