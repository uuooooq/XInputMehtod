//
//  KeyCombinViewController.swift
//  XInputMehtod
//
//  Created by zhu dongwei on 14/08/2017.
//  Copyright © 2017 zhudongwei. All rights reserved.
//

import UIKit

class KeyCombinViewController: UIViewController {
    
    @IBOutlet var inputMethodView : UIView!
    @IBOutlet var btn0:UIButton!
    @IBOutlet var btn1:UIButton!
    @IBOutlet var btn2:UIButton!
    var currentKeyBox:KeyBox = KeyBox(keys: [Key](), boxIndex:KeyIndex(rowIndex: 0,columnIndex: 0))

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reflashKeys()
    }
    
    func reflashKeys() {
        let keyviews = self.inputMethodView.subviews
        for tmpview in keyviews {
            tmpview.removeFromSuperview()
        }
        addTmpBtns()
    }
    
    func addTmpBtns() {
        let btnWidth = UIScreen.main.bounds.size.width/10;
        print("this device's inputkey width is \(btnWidth)");
        //let combineArr =
        for i in 0...3 {
            for j in 0...9 {
                let index = i*10+j;
                let key = KeyBoards.getKeyByKeyboard(name: "testKeyBaord", index: index) //self.keyboard.keys[index]
                //print("this is default key \(key.keyDesc)")
                if key.isCombine {
                    continue
                }
                let newbtn1 = UIButton(type: .roundedRect);
                newbtn1.frame = CGRect(x: j*Int(btnWidth)+6, y: i*48+48+8, width: Int(btnWidth-6), height: 48-8)
                newbtn1.setTitle(key.keyDesc, for: UIControlState.normal);
                newbtn1.setTitleColor(UIColor.black, for: .normal);
                newbtn1.layer.cornerRadius = 8
                newbtn1.backgroundColor = UIColor.white
                newbtn1.addTarget(self, action: #selector(clickAction(btn:)), for: .touchUpInside);
                newbtn1.tag = index;
                //                if(key.isShow){
                //                    newbtn1.isHidden
                //                }
                newbtn1.isHidden = key.isShow
                
                for tmpkey in self.currentKeyBox.keys {
                    if tmpkey == key {
                        newbtn1.backgroundColor = UIColor.red
                    }
                }
                
                
                inputMethodView.addSubview(newbtn1);
            }
        }
    }
    
    func clickAction(btn:UIButton){
        //let key = self.keyboard.keys[btn.tag]
        let indexValue = btn.tag
        let key = KeyBoards.getKeyByKeyboard(name: "testKeyBaord", index: indexValue)
        //self.performSegue(withIdentifier: "keysetting", sender: self);
        print("the key \(key.keyDesc) is clicked at the moment")
        
        self.currentKeyBox.keys.append(key)
        reflashKeys()
        
    }
    
    @IBAction func combineAction(btn:UIButton){
        let btnWidth = UIScreen.main.bounds.size.width/10;
        print("this device's inputkey width is \(btnWidth)");
        //let combineArr =
        for i in 0...3 {
            for j in 0...9 {
                let index = i*10+j;
                let key = KeyBoards.getKeyByKeyboard(name: "testKeyBaord", index: index) //self.keyboard.keys[index]
                print("this is default key \(key.keyDesc)")
                for tmpkey in self.currentKeyBox.keys {
                    if tmpkey == key {
                        //newbtn1.backgroundColor = UIColor.red
                        key.isCombine = true
                        KeyBoards.updateKey(key: key, keyBoardName: "testKeyBaord", index: index)
                    }
                }
                
            }
        }
        reflashKeys()
    }
    
    
    /// 对给定的数组按下标从小到大排序
    ///
    /// - parameter keysArr: 给定的数组
    /// - parameter isRow: 说明给定的数组排序是按row下标还是columen下标排序
    func sortKeys(keysArr:Array<Key>, isRow:Bool) -> KeyIndex {
        return KeyIndex(rowIndex: 0, columnIndex: 0)
    }
    
    /// 把已经选择的key按照列分离出来
    func separateKeysToColumnArray() -> Dictionary<Int, Array<Key>> {
        
        var separateDic = [Int:Array<Key>]()
        for key in self.currentKeyBox.keys {
            if((separateDic[key.keyIndex.columnIndex]) != nil){
                separateDic[key.keyIndex.columnIndex]?.append(key)
            }
            else{
                separateDic[key.keyIndex.columnIndex] = [key]
            }
        }
        
        
        return separateDic
    }
    
    /// 把已经选择的key按照行分离出来
    func separateKeysToRowArray() -> Dictionary<Int, Array<Key>> {
        
        var separateDic = [Int:Array<Key>]()
        for key in self.currentKeyBox.keys {
            if((separateDic[key.keyIndex.rowIndex]) != nil){
                separateDic[key.keyIndex.rowIndex]?.append(key)
            }
            else{
                separateDic[key.keyIndex.rowIndex] = [key]
            }
        }
        
        
        return separateDic

    }
    
    /// 判断每行或者每列的keys是否连续
    ///
    /// - parameter keysDic: 里面保存分离号的key
    /// - parameter isRow: 是用来说明这个字典的value中的keys是按row分离的还是按column分离
    func isKeysSerial(keysDic:Dictionary<Int, Array<Key>>, isRow:Bool) -> Bool{
        for(tmpKey, tmpValue) in keysDic{
            
            /// 如果isRow为真，判断column下标的值是否连续
            /// 否则则判断row下标的值是否是连续的
            if(isRow){
                
            }
            else{
                
            }
        }
        return true
    }
    
    /// 判断每行或者每列的个数是否相等
    ///
    /// - parameter separeateDic 里面保存分离号的key
    /// - parameter isRow: 是用来说明这个字典的value中的keys是按row分离的还是按column分离
    func isSepareateKeysNumberEqual(separeateDic:Dictionary<Int, Array<Key>>, isRow:Bool) -> Bool {
        return true
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
