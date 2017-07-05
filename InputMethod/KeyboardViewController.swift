//
//  KeyboardViewController.swift
//  InputMethod
//
//  Created by zhudongwei on 04/07/2017.
//  Copyright © 2017 zhudongwei. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true);
        
        let heightConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: 245);
        self.view.addConstraint(heightConstraint);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        addTmpBtns();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    func addTmpBtns() {
        let btnWidth = UIScreen.main.bounds.size.width/10;
        print("this device's inputkey width is \(btnWidth)");
        for i in 0...3 {
            for j in 0...9 {
                let newbtn1 = UIButton(type: .roundedRect);
                //newbtn1.frame = CGRect(x:j*btnWidth , y: i*48+48, width: btnWidth, height: 48);
                newbtn1.frame = CGRect(x: j*Int(btnWidth), y: i*48+48, width: Int(btnWidth), height: 48)
                newbtn1.setTitle("j", for: UIControlState.normal);
                newbtn1.setTitleColor(UIColor.black, for: .normal);
                newbtn1.layer.borderColor = UIColor.black.cgColor;
                newbtn1.layer.borderWidth = 1.0;
                newbtn1.layer.masksToBounds = true;
                newbtn1.addTarget(self, action: #selector(clickAction(btn:)), for: .touchUpInside);
                self.view.addSubview(newbtn1);
            }
        }
    }
    
    func clickAction(btn:UIButton) {
        self.textDocumentProxy.insertText((btn.titleLabel?.text)!)
    }

}
