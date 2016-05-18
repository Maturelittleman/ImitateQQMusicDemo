//
//  QQMusicListCell.swift
//  QQMusic
//
//  Created by 仲琦 on 16/5/18.
//  Copyright © 2016年 仲琦. All rights reserved.
//

import UIKit

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
        iconImageView.layer.cornerRadius = iconImageView.frame.width * 0.5
        iconImageView.layer.masksToBounds = true
        
    }
    
    //设置高亮显示为空
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        
    }
}
