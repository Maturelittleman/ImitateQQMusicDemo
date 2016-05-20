//
//  QQMusicMessageModel.swift
//  QQMusic
//
//  Created by 仲琦 on 16/5/20.
//  Copyright © 2016年 仲琦. All rights reserved.
//

import UIKit

class QQMusicMessageModel: NSObject {
    
    //实例化对象不可为空
//    var listModel = QQListModel()
    //可选类型 可以为空
    var listModel: QQListModel?
    
    //总时长
    var totalTime: NSTimeInterval = 0
    //处理总时长数据
    var totalTimeFormat: String {
        get {
            return ZQTimeTool.getFormatTime(totalTime)
        }
    }
    
    //已播放时常
    var costTime: NSTimeInterval = 0
    //处理已播放数据
    var costTimeFormat: String {
        get {
            return ZQTimeTool.getFormatTime(costTime)
        }
    }
    
    //播放状态
    var player: Bool = false

}
