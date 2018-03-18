//
//  ExtensionForVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    
    func setSwipe(){
        //🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻{добавляем свайп - это когда пальцем двигаешь влево и телефон это понимает
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
        //🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹}
    }
    
    @objc func swipeDetected(swipe: UISwipeGestureRecognizer){
        print("swipe!")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = InitViewController()
        window?.makeKeyAndVisible()
    }
}

