//
//  QQListTVC.swift
//  QQMusic
//
//  Created by 仲琦 on 16/5/18.
//  Copyright © 2016年 仲琦. All rights reserved.
//

import UIKit

class QQListTVC: UITableViewController {
    
    var musicMs: [QQListModel] = [QQListModel]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //取出数据
        QQMusicDataTool.getMusicData { (musicMs) -> () in
            self.musicMs = musicMs
            ZQAudioOperationTool.sharInstance.musicMList = musicMs
        }
        
        //界面搭建
        setUpInit()
    }
}

//数据显示
extension QQListTVC {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return musicMs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //创建自定义cell
        let cell = QQMusicListCell.cellWithTableView(tableView)
        //取出模型
        cell.musicM = musicMs[indexPath.row]
        //选定样式
        cell.selectionStyle = .None
        
        return cell
    }
    
    //cell即将显示调用
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        //动画效果
        let musicCell = cell as! QQMusicListCell
        musicCell.beginAnimation(AnimationType.Translation)
    }
    
    //cell被点击的时候调用
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //拿到数据模型
        let musicM = musicMs[indexPath.row]
        //播放音乐
        ZQAudioOperationTool.sharInstance.playMusic(musicM)
        //跳转到详情界面
        performSegueWithIdentifier("listToDetail", sender: nil)
    }
}


//界面搭建
extension QQListTVC {
    
    private func setUpInit() -> () {
        setUpTableView()
        setUpNavigationBar()
    }
    
    private func setUpTableView() -> () {
        //背景图片
        let imageV = UIImageView(image: UIImage(named: "QQListBack"))
        tableView.backgroundView = imageV
        
        //行高
        tableView.rowHeight = 60
        
        //分割线效果
        tableView.separatorStyle = .None
        
        
    }
    
    private func setUpNavigationBar() -> () {
        //设置顶部导航栏隐藏
        navigationController?.navigationBarHidden = true
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        //设置状态栏字体颜色
        return .LightContent
    }
    
}
