//
//  ZQTimeTool.swift
//  QQMusic
//
//  Created by 仲琦 on 16/5/21.
//  Copyright © 2016年 仲琦. All rights reserved.
//

import UIKit

class ZQTimeTool: NSObject {
    
    class func getFormatTime(time: NSTimeInterval) -> String{
        
        let min = Int(time / 60)
        let sec = Int(time) % 60
        
        let resultStr = String(format: "%02d:%02d", min, sec)
        
        return resultStr
    }

}
