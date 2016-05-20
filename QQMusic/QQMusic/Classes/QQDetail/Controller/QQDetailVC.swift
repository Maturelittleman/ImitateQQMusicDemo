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
    
    //背景图片 1
    @IBOutlet weak var backImageView: UIImageView!
    //专辑图片 1
    @IBOutlet weak var foreImageView: UIImageView!
    //总时长 1
    @IBOutlet weak var totalTimeLabel: UILabel!
    //歌手 1
    @IBOutlet weak var singerLabel: UILabel!
    //歌名 1
    @IBOutlet weak var songLabel: UILabel!
    
    //进度条 n
    @IBOutlet weak var progressSlider: UISlider!
    //歌词 n
    @IBOutlet weak var lrcLabel: UILabel!
    //已播放时长 n
    @IBOutlet weak var costTimeLabel: UILabel!
    
    
    //歌词背景视图 0
    @IBOutlet weak var lrcBackView: UIScrollView!
    //歌词视图 0
    var lrcView: UIView?
    
    var timer: NSTimer?
}

//业务逻辑
extension QQDetailVC {
    
    //播放暂停
    @IBAction func playOrPause(sender: UIButton) {
        //点击切换属性
        sender.selected = !sender.selected
        //判断当前状态
        if sender.selected {
            ZQAudioOperationTool.sharInstance.pauseCurrentMusic()
        }else {
            ZQAudioOperationTool.sharInstance.playCurrentMusic()
        }
    }
    
    //上一首
    @IBAction func preMusic() {
        ZQAudioOperationTool.sharInstance.preMusic()
        setUpDataOnce()
    }
    
    //下一首
    @IBAction func nextMusic() {
        ZQAudioOperationTool.sharInstance.nextMusic()
        setUpDataOnce()
    }
    
    //加载视图时调用
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewOnce()
    }
    
    //在由frame的改变而触发输出subview之前，这个方法被调用
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpFrame()
    }
    
    //视图即将显示时调用
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addTimer()
        setUpDataOnce()
    }
    
    //视图即将离开时调用
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
    }
    
    //返回界面
    @IBAction func homeBtnClick(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}

//数据展示
extension QQDetailVC {
    
    //切换歌曲时, 更新一次
    func setUpDataOnce() {
        
        //取出最新的数据
        let musicMessageModel = ZQAudioOperationTool.sharInstance.getNewMessageModel()
        
        let imageName = musicMessageModel.listModel?.icon ?? ""
        //背景图片
        backImageView.image = UIImage(named: imageName)
        //前景图片图片
        foreImageView.image = UIImage(named: imageName)
        //总时长
        totalTimeLabel.text = musicMessageModel.totalTimeFormat
        //歌曲名
        songLabel.text = musicMessageModel.listModel?.name
        //歌手名
        singerLabel.text = musicMessageModel.listModel?.singer
    }
    
    //每秒刷新一次的数据
    func setUpDataTimes() {
        
        //取出最新的数据
        let musicMessageModel = ZQAudioOperationTool.sharInstance.getNewMessageModel()
        //已播放的市场
        costTimeLabel.text = musicMessageModel.costTimeFormat
        //进度条
        progressSlider.value = Float(musicMessageModel.costTime / musicMessageModel.totalTime)
        
        
    }
    
    //开始定时器
    func addTimer() {
        
        timer = NSTimer(timeInterval: 1.0, target: self, selector: "setUpDataTimes", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
    }
    
    //关闭定时器
    func stopTimer() {
        
        timer?.invalidate()
        timer = nil
    }
}

//界面处理
extension QQDetailVC {
    
    //界面添加子控件
    func setUpViewOnce() {
        
        setUpSlider()
        addLrcView()
    }
    
    //设置界面Frame
    func setUpFrame() {
        
        setUpForeImageView()
        setUplrcViewFrame()
    }
    
    //设置进度条豆豆样式
    func setUpSlider() {
        
        progressSlider.setThumbImage(UIImage(named: "player_slider_playback_thumb"), forState: UIControlState.Normal)
    }
    
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
        //scrollView代理
        lrcBackView.delegate = self
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

//动画效果处理
extension QQDetailVC: UIScrollViewDelegate{
    
    //拖动scrollView调用 歌词面板效果
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let alpha = 1 - scrollView.contentOffset.x / scrollView.width
        
        foreImageView.alpha = alpha
        lrcLabel.alpha = alpha
    }
    
}