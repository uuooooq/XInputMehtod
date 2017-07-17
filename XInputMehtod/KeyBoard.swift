//
//  KeyBoard.swift
//  XInputMehtod
//
//  Created by zhudongwei on 17/07/2017.
//  Copyright © 2017 zhudongwei. All rights reserved.
//

import Foundation

class KeyBoard: NSObject {
    
    var keyBoardName:NSString
    var keyBoardDesc:NSString
    var keys:NSArray

    
    init(keyBoardName:NSString, keyBoardDesc:NSString) {
        self.keyBoardName = keyBoardName
        self.keyBoardDesc = keyBoardDesc
        self.keys = NSArray()
    }
    
}
