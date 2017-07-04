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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTmpBtns() {
        let btnWidth = UIScreen.main.bounds.size.width/10;
        print("this device's inputkey width is /(btnWidth)");
    }


}

