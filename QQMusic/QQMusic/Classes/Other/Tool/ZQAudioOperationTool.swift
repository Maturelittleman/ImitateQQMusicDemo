//
//  ZQAudioOperationTool.swift
//  QQMusic
//
//  Created by 仲琦 on 16/5/18.
//  Copyright © 2016年 仲琦. All rights reserved.
//  负责的音乐播放的业务逻辑, 比如, 顺序播放, 随机播放等等

import UIKit

class ZQAudioOperationTool: NSObject {
    
    //单例模式
    static let sharInstance = ZQAudioOperationTool()
    
    //播放工具
    let tool = ZQAudioTool()
    
    //播放音乐
    func playMusic(musicM: QQListModel) -> () {
        //取出模型中的音乐名称
        let fileName = musicM.filename
        //播放音乐
        tool.playAudioWithName(fileName!)
    }

}
