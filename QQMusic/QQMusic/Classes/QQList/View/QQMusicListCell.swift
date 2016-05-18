//
//  QQMusicListCell.swift
//  QQMusic
//
//  Created by 仲琦 on 16/5/18.
//  Copyright © 2016年 仲琦. All rights reserved.
//

import UIKit

//列表动画
enum AnimationType {
    case Rotation  //旋转动画
    case Translation  //平移动画
}

class QQMusicListCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    var musicM: QQListModel? {
        didSet {
            if musicM?.icon != nil {
                iconImageView.image = UIImage(named: (musicM?.icon)!)
            }
            songLabel.text = musicM?.name
            singerLabel.text = musicM?.singer
        }
    }
    
    
    class func cellWithTableView(tableView: UITableView) -> QQMusicListCell{
        //cell的标识
        let cellID = "musicList"
        //缓存池中取cell
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? QQMusicListCell
        //缓存池中没有就创建cell
        if cell == nil {
            print("创建Cell")
            cell = NSBundle.mainBundle().loadNibNamed("QQMusicListCell", owner: nil, options: nil).first as? QQMusicListCell
        }
        return cell!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //裁剪头像为圆形
        iconImageView.layer.cornerRadius = iconImageView.width * 0.5
        iconImageView.layer.masksToBounds = true
    }
    
    //设置高亮显示为空
    override func setHighlighted(highlighted: Bool, animated: Bool) {}
    
}


extension QQMusicListCell {
    
    //开始列表动画
    func beginAnimation(type: AnimationType) -> () {
        //两种动画选择,枚举
        switch type {
        case .Rotation:
            //移除之前的动画
            self.layer.removeAnimationForKey("rotation")
            //创建CAlayer动画
            let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
            //设置值
            animation.values = [M_PI * 0.25, 0]
            //设置时间
            animation.duration = 0.2
            //添加到当前layer
            self.layer.addAnimation(animation, forKey: "rotation")
            
        case .Translation:
            self.layer.removeAnimationForKey("translation")
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.duration = 0.2
            animation.values = [70, 0]
            self.layer.addAnimation(animation, forKey: "translation")
        }
    }

    }
