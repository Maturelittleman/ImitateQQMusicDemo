//
//  ZQAudioTool.swift
//  QQMusic
//
//  Created by 仲琦 on 16/5/18.
//  Copyright © 2016年 仲琦. All rights reserved.
//  提供 单手音乐的操作(播放, 暂停, 停止, 快进, 倍速)

import UIKit
import AVFoundation

class ZQAudioTool: NSObject {
    
    var player: AVAudioPlayer?

    //根据音频名称播放音频
    func playMusic(name: String) -> () {
        
        //取出url
        guard let url = NSBundle.mainBundle().URLForResource(name, withExtension: nil) else {
            return
        }
        
        //播放的是同一首歌曲
        if url == player?.url {
            player?.play()
            return
        }
        
        //添加到 播放器中
        do {
            player = try AVAudioPlayer(contentsOfURL: url)
        }catch {
            print(error)
            return
        }
        
        //准备播放
        player?.prepareToPlay()
        //开始播放
        player?.play()
    }
    
    //继续播放
    func resumeCurrentMusic() {
        player?.play()
    }
    
    //暂停音频
    func pauseCurrentMusic() {
        player?.pause()
    }
    
    
}
