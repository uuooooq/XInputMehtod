//
//  Key.swift
//  XInputMehtod
//
//  Created by zhudongwei on 17/07/2017.
//  Copyright © 2017 zhudongwei. All rights reserved.
//

import Foundation
import UIKit

struct KeyIndex {
    var rowIndex:Int
    var columnIndex:Int
}

class Key: NSObject {
    
    // KeyInfo类属性
    var isCombine:Bool
    var isShow:Bool
    var keyDesc:String
    var keyInputInfo:String
    var keyTextColor:UIColor
    var keyFontSize:Int
    var keyIndex:KeyIndex
    
    // 初始化KeyInfo
    init(isCombine:Bool, isShow:Bool, keyDesc:String,
         keyInputInfo:String, keyTextColor:UIColor,
         keyFontSize:Int, keyIndex:KeyIndex) {
        
        self.isCombine = isCombine
        self.isShow = isShow
        self.keyDesc = keyDesc
        self.keyInputInfo = keyInputInfo
        self.keyTextColor = keyTextColor
        self.keyFontSize = keyFontSize
        self.keyIndex = keyIndex
        
    }
}
