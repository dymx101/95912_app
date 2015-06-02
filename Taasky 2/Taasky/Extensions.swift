//
//  Extensions.swift
//  Taasky
//
//  Created by Audrey M Tam on 18/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(colorArray array: NSArray) {
    let r = array[0] as! CGFloat
    let g = array[1] as! CGFloat
    let b = array[2] as! CGFloat
    self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha:1.0)
  }
}

extension UIViewController {
    
    func installChildVC(childVC: UIViewController!, containerView : UIView) {
        if (containerView.isDescendantOfView(self.view)) {
            self.addChildViewController(childVC)
            childVC.view.frame = containerView.bounds;
            childVC.view.autoresizingMask = .FlexibleWidth | .FlexibleHeight
            containerView.addSubview(childVC.view);
            childVC.didMoveToParentViewController(self);
        }
    }
    
    func uninstallFromParent() {
        self.willMoveToParentViewController(nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
}