//
//  KeyBoard.swift
//  XInputMehtod
//
//  Created by zhudongwei on 17/07/2017.
//  Copyright © 2017 zhudongwei. All rights reserved.
//

import Foundation
import UIKit

class KeyBoard: NSObject {
    
    var keyBoardName:NSString
    var keyBoardDesc:NSString
    var keys:NSArray

    
    init(keyBoardName:NSString, keyBoardDesc:NSString) {
        
        func createInitKeys() -> NSArray{
            //return NSArray();
            for i in 0...3 {
                for j in 0...9 {
                    
                    var tmpKey = Key.init(isCombine: false, isShow: true, keyDesc: "\(i)\(j)" as NSString, keyInputInfo: "keyinputinfo\(i)\(j)", keyTextColor: UIColor.gray, keyFontSize: 15, keyIndex: );
                }
            }
        }
        
        self.keyBoardName = keyBoardName
        self.keyBoardDesc = keyBoardDesc
        self.keys = createInitKeys()
        

    }
    
}
