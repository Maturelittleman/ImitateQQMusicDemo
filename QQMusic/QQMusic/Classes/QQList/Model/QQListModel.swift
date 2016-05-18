//
//  QQListModel.swift
//  QQMusic
//
//  Created by 仲琦 on 16/5/18.
//  Copyright © 2016年 仲琦. All rights reserved.
//

import UIKit

class QQListModel: NSObject {

    /** 歌曲名称 */
    var name: String?
    
    /** 歌曲文件名称 */
    var filename: String?
    
    /** 歌词文件名称  */
    var lrcname: String?
    
    /** 演唱者 */
    var singer: String?
    
    /** 歌手头像 */
    var singerIcon: String?
    
    /** 专辑图片 */
    var icon: String?

    //从写init方法
    override init() {
        super.init()
    }
    
    //字典转模型
    init(dict: [String: AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    
    override func setValue(value: AnyObject?, forKey key: String) {
        
    }
    
}
