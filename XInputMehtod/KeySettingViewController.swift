//
//  KeySettingViewController.swift
//  XInputMehtod
//
//  Created by zhudongwei on 06/07/2017.
//  Copyright © 2017 zhudongwei. All rights reserved.
//

import UIKit

class KeySettingViewController: UIViewController, UITextFieldDelegate {
    
    //var keyinfo:Key?
    var keyIndex:Int?
    @IBOutlet weak var isCombineControl:UISwitch!
    @IBOutlet weak var isShowControl:UISwitch!
    @IBOutlet weak var keyDescControl:UITextField!
    @IBOutlet weak var keyInputInfoControl:UITextField!
    @IBOutlet weak var keyTextColorControl:UITextField!
    @IBOutlet weak var keyFontSizeControl:UITextField!

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let key = KeyBoards.getKeyByKeyboard(name: "testKeyBaord", index: self.keyIndex!)
        self.isCombineControl.isOn = key.isCombine
        self.isShowControl.isOn = key.isShow
        self.keyDescControl.text = key.keyDesc
        self.keyInputInfoControl.text = key.keyInputInfo
        //keyTextColorControl.text = self.keyinfo!.keyTextColor
        self.keyTextColorControl.text = UIColor.toHexString(with: key.keyTextColor)
        self.keyFontSizeControl.text = "\(key.keyFontSize)"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - TextField delegate 应该有数据完整性的检查和判断
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let key = KeyBoards.getKeyByKeyboard(name: "testKeyBaord", index: self.keyIndex!)
        if(self.keyDescControl == textField){
            key.keyDesc = textField.text!
        }
        if(self.keyInputInfoControl == textField){
            key.keyInputInfo = textField.text!
        }
        if(self.keyTextColorControl == textField){
            key.keyTextColor = UIColor.toUIColor(with: textField.text!)
        }
        if(self.keyFontSizeControl == textField){
            key.keyFontSize = Int(textField.text!)!
        }
        
        KeyBoards.updateKey(key: key, keyBoardName:"testKeyBaord" , index: self.keyIndex!)
        
        print("update key info ...")
    }
    
    

}
