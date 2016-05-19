//
//  QQDetailVC.swift
//  QQMusic
//
//  Created by 仲琦 on 16/5/18.
//  Copyright © 2016年 仲琦. All rights reserved.
//

import UIKit

//专门用来保存属性
class QQDetailVC: UIViewController {
    
    //专辑图片
    @IBOutlet weak var foreImageView: UIImageView!
    //歌词
    @IBOutlet weak var lrcLabel: UILabel!
    
    //歌词背景视图
    @IBOutlet weak var lrcBackView: UIScrollView!
    //歌词视图
    var lrcView: UIView?
}

//业务逻辑
extension QQDetailVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLrcView()
        
    }
    
    override func viewDidLayoutSubviews() {
        
        setUpForeImageView()
        setUplrcViewFrame()
    }
    
}

//界面处理
extension QQDetailVC {
    
    //设置歌词的frame
    func setUplrcViewFrame() {
        
        lrcView?.frame = lrcBackView.bounds
        lrcView?.x = lrcBackView.width
        lrcBackView.contentSize = CGSizeMake(lrcBackView.width * 2, 0)
        
    }
    
    //添加 歌词视图
    func addLrcView() {
        
        //创建view
        lrcView = UIView()
        lrcView?.backgroundColor = UIColor.redColor()
        
        //添加进背景中
        lrcBackView.addSubview(lrcView!)
        //设置分页
        lrcBackView.pagingEnabled = true
        //设置滚动条
        lrcBackView.showsHorizontalScrollIndicator = false
    }
    
    //设置专辑图片圆角
    func setUpForeImageView() {
        
        foreImageView.layer.cornerRadius = foreImageView.width * 0.5
        foreImageView.layer.masksToBounds = true
    }
    
    //设置状态栏
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}