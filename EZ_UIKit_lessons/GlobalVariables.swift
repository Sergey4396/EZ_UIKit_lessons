//
//  GlobalVariables.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import Foundation
import UIKit

var switchN1: UISwitch!
var switchN2: UISwitch!
var switchN3: UISwitch!
var currentSwitch : UISwitch!
var currentButton : UIButton!
var opsButton : UIButton!
var isButtonAvailable = false
var newLabel : UILabel!
var newLabel2 : UILabel!
var window : UIWindow!
var titleLabel: UILabel!
var currentLabel: UILabel!

var currentTextField : UITextField!


struct AllFirstControllersStruct{
    static var allFirstControllersDictsArray : [AllFirstControllersStruct] = []
    var name : String
    var controller : UIViewController
    init(name:String, controller: UIViewController) {
        self.name = name
        self.controller = controller
        AllFirstControllersStruct.allFirstControllersDictsArray.append(self)
    }
}
var isVCset = false
func setVCNamesForAllLessons(){
    _ = AllFirstControllersStruct(name: "5 lesson", controller: VC1())
    _ = AllFirstControllersStruct(name: "5 - 1", controller: VC5_1())
    _ = AllFirstControllersStruct(name: "5 - 1_2", controller: VC5_1_2())
    _ = AllFirstControllersStruct(name: "5 - 2", controller: VC5_2())
    _ = AllFirstControllersStruct(name: "5 - 4", controller: VC5_4())
    _ = AllFirstControllersStruct(name: "5 - 5", controller: VC5_5())
    _ = AllFirstControllersStruct(name: "6 - 1", controller: VC6_1())
    isVCset = true
}
