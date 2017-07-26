//
//  KeySettingViewController.swift
//  XInputMehtod
//
//  Created by zhudongwei on 06/07/2017.
//  Copyright © 2017 zhudongwei. All rights reserved.
//

import UIKit

class KeySettingViewController: UIViewController {
    
    var keyinfo:Key?
    @IBOutlet var isCombineControl:UISwitch!
    @IBOutlet var isShowControl:UISwitch!
    @IBOutlet var keyDescControl:UITextField!
    @IBOutlet var keyInputInfoControl:UITextField!
    @IBOutlet var keyTextColorControl:UITextField!
    @IBOutlet var keyFontSizeControl:UITextField!
    

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
        
        self.isCombineControl.isOn = self.keyinfo!.isCombine
        self.isShowControl.isOn = self.keyinfo!.isShow
        self.keyDescControl.text = self.keyinfo!.keyDesc
        self.keyInputInfoControl.text = self.keyinfo!.keyInputInfo
        //keyTextColorControl.text = self.keyinfo!.keyTextColor
        self.keyTextColorControl.text = UIColor.toHexString(with: self.keyinfo!.keyTextColor)
        self.keyFontSizeControl.text = "\(self.keyinfo!.keyFontSize)"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
