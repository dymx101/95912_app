//
//  UIStoryBoard+MathMatch.swift
//  MathMatchII
//
//  Created by DongYiming on 5/31/15.
//  Copyright (c) 2015 PhotoMagic. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static func mainBoard()-> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    func studentsVC()-> UIViewController {
        return self.instantiateViewControllerWithIdentifier("PMStudentsVC") as! UIViewController
    }
}
