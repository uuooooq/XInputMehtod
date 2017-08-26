//
//  Keyboards.swift
//  XInputMehtod
//
//  Created by zhudongwei on 28/07/2017.
//  Copyright © 2017 zhudongwei. All rights reserved.
//

import Foundation
import UIKit
/// 继承自UIViewController
class KeyBoards: NSObject {
    static var keyboards=[String: KeyBoard]()
    
    
    class func getKeyboardBy(name:String) -> KeyBoard{
        if(self.keyboards.isEmpty){
            self.createKeyBoardWith(name: name)
        }
        return (self.keyboards[name])!
    }
    
    class func getKeyByKeyboard(name:String, index:Int) -> Key {
        if(self.keyboards.isEmpty){
            self.createKeyBoardWith(name: name)
        }
        let keyboard = (self.keyboards[name])!
        return keyboard.keyBoxes[index].keys[0]
    }
    class func createKeyBoardWith(name:String) {
        let keyboard = KeyBoard.init(keyBoardName: name, keyBoardDesc: "testDesc")
        self.keyboards[name] = keyboard
    }
    
    ///  Get the url of category of technology
    ///
    ///  - parameter key: Current page index
    ///  - parameter keyBoardName:    How many rows to load
    ///  - parameter index: xxxxx
    ///
    ///  - returns: The absolute url
    class func updateKey(key:Key, keyBoardName:String, index:Int) {
        let keyboard = self.getKeyboardBy(name: keyBoardName)
        keyboard.keyBoxes[index].keys[0] = key
    }
    
}
