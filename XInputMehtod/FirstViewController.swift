//
//  FirstViewController.swift
//  XInputMehtod
//
//  Created by zhudongwei on 04/07/2017.
//  Copyright © 2017 zhudongwei. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var inputMethodView : UIView!
    @IBOutlet var testTF : UITextField!
    let keyboard = KeyBoard.init(keyBoardName: "testname", keyBoardDesc: "testDesc")
    var indexValue:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addTmpBtns();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTmpBtns() {
        let btnWidth = UIScreen.main.bounds.size.width/10;
        print("this device's inputkey width is \(btnWidth)");
        
        for i in 0...3 {
            for j in 0...9 {
                let index = i*10+j;
                let key = self.keyboard.keys[index]
                print("this is default key \(key.keyDesc)")
                let newbtn1 = UIButton(type: .roundedRect);
                //newbtn1.frame = CGRect(x:j*btnWidth , y: i*48+48, width: btnWidth, height: 48);
                newbtn1.frame = CGRect(x: j*Int(btnWidth), y: i*48+48, width: Int(btnWidth), height: 48)
                newbtn1.setTitle(key.keyDesc, for: UIControlState.normal);
                newbtn1.setTitleColor(UIColor.black, for: .normal);
                newbtn1.layer.borderColor = UIColor.black.cgColor;
                newbtn1.layer.borderWidth = 1.0;
                newbtn1.layer.masksToBounds = true;
                newbtn1.addTarget(self, action: #selector(clickAction(btn:)), for: .touchUpInside);
                newbtn1.tag = index;
                inputMethodView.addSubview(newbtn1);
            }
        }
    }
    
    func clickAction(btn:UIButton){
        //let key = self.keyboard.keys[btn.tag]
        self.indexValue = btn.tag
        self.performSegue(withIdentifier: "keysetting", sender: self);
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue.destination.setValue("valuesss", forKey: "keyss")
        let key = self.keyboard.keys[self.indexValue!]
        let keyVC = segue.destination as! KeySettingViewController
        keyVC.keyinfo = key
        //segue.destination.keyinfo = key
    }

}

