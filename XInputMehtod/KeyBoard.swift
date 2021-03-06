//
//  KeyBoard.swift
//  XInputMehtod
//
//  Created by zhudongwei on 17/07/2017.
//  Copyright © 2017 zhudongwei. All rights reserved.
//

import Foundation
import UIKit

struct KeyBox {
    var keys:Array<Key>
    var boxIndex:KeyIndex
}

/**
 ## Feature Support
 
 This class does some awesome things. It supports:
 
 - Feature 1
 - Feature 2
 - Feature 3
 
 ## Examples
 
 Here is an example use case indented by four spaces because that indicates a
 code block:
 
 let myAwesomeThing = MyAwesomeClass()
 myAwesomeThing.makeMoney()
 
 ## Warnings
 
 There are some things you should be careful of:
 
 1. Thing one
 2. Thing two
 3. Thing three
 */
class KeyBoard: NSObject {
    
    var keyBoardName:String
    var keyBoardDesc:String
    var keyBoxes:Array<KeyBox>

    
    init(keyBoardName:String, keyBoardDesc:String) {
        
        func createInitKeys() -> Array<KeyBox>{
            
            var returnArr = [KeyBox]()
            for i in 0...3 {
                for j in 0...9 {
                    
                    let tmpKeyIndex = KeyIndex(rowIndex: i, columnIndex:j)
            
                    
                    let tmpKey = Key.init(isCombine: false, isShow: false, keyDesc: "\(i)\(j)", keyInputInfo: "keyinputinfo\(i)\(j)", keyTextColor: UIColor.gray, keyFontSize: 15, keyIndex:tmpKeyIndex);
                    var tmpKeyBox = KeyBox(keys: [Key](), boxIndex: tmpKeyIndex)
                    tmpKeyBox.keys.append(tmpKey)
                    returnArr.append(tmpKeyBox)
                }
               
            }
            return returnArr
        }
        
        self.keyBoardName = keyBoardName
        self.keyBoardDesc = keyBoardDesc
        self.keyBoxes = createInitKeys()
        

    }
    
}
