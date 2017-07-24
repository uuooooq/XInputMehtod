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
    
    var keyBoardName:String
    var keyBoardDesc:String
    var keys:Array<Key>

    
    init(keyBoardName:String, keyBoardDesc:String) {
        
        func createInitKeys() -> Array<Key>{
            
            var returnArr = [Key]()
            for i in 0...3 {
                for j in 0...9 {
                    
                    let tmpKeyIndex = KeyIndex(rowIndex: i, columnIndex:j)
            
                    
                    let tmpKey = Key.init(isCombine: false, isShow: true, keyDesc: "\(i)\(j)", keyInputInfo: "keyinputinfo\(i)\(j)", keyTextColor: UIColor.gray, keyFontSize: 15, keyIndex:tmpKeyIndex);
                    returnArr.append(tmpKey)
                }
               
            }
            return returnArr
        }
        
        self.keyBoardName = keyBoardName
        self.keyBoardDesc = keyBoardDesc
        self.keys = createInitKeys()
        

    }
    
}
