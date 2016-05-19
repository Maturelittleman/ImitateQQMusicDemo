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
    //因为会用很多界面使用,多个界面数据操作一致
    static let sharInstance = ZQAudioOperationTool()
    
    //播放工具
    let tool = ZQAudioTool()
    
    //角标
    var index = 0 {
        didSet {
            //容错处理
            //不让歌曲切换时越界
            if index < 0
            {
                index = (musicMList?.count ?? 0) - 1
            }
            if index > (musicMList?.count ?? 0) - 1 {
                index = 0
            }
        }
    }
    
    //音乐播放列表
    var musicMList: [QQListModel]?
    
    //播放音乐
    func playMusic(musicM: QQListModel) -> () {
        
        //取出模型中的音乐名称
        let fileName = musicM.filename ?? ""
        //播放音乐
        tool.playMusic(fileName)
        
        index = (musicMList?.indexOf(musicM))!
    }
    
    //继续播放
    func playCurrentMusic() {
        tool.resumeCurrentMusic()
    }
    
    //暂停播放
    func pauseCurrentMusic() {
        tool.pauseCurrentMusic()
    }
    
    //下一首
    func nextMusic() {
        
        index += 1
        
        if let tempList = musicMList {
            //取出模型
            let musicM = tempList[index]
            //播放音乐
            playMusic(musicM)
        }
    }
    
    //上一首
    func preMusic() {
        
        index -= 1
        
        if let tempList = musicMList {
            //取出模型
            let musicM = tempList[index]
            playMusic(musicM)
        }
    }
}
