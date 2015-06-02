//
//  DetailViewController.swift
//  Taasky
//
//  Created by Audrey M Tam on 18/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var backgroundImageView: UIImageView!
  
  var hamburgerView: HamburgerView?
    
    var currentVC: UIViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Remove the drop shadow from the navigation bar
    navigationController!.navigationBar.clipsToBounds = true
    
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "hamburgerViewTapped")
    hamburgerView = HamburgerView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    hamburgerView!.addGestureRecognizer(tapGestureRecognizer)
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: hamburgerView!)
  }
  
  func hamburgerViewTapped() {
    let navigationController = parentViewController as! UINavigationController
    let containerViewController = navigationController.parentViewController as! ContainerViewController
    containerViewController.hideOrShowMenu(!containerViewController.showingMenu, animated: true)
  }
  
  var menuItem: NSDictionary? {
    didSet {
      if let newMenuItem = menuItem {
        view.backgroundColor = UIColor(colorArray: newMenuItem["colors"] as! NSArray)
        backgroundImageView?.image = UIImage(named: newMenuItem["bigImage"] as! String)
        
        ///
        currentVC?.uninstallFromParent()
        
        let type: NSInteger? = newMenuItem["type"]?.integerValue
        if let type_ = type {
            switch(type_) {
            case 0:
    
                currentVC = UIStoryboard.mainBoard().studentsVC()
                self.installChildVC(currentVC, containerView: self.view)
                
            default:
                
                println("unkown type")
            }
        }
      }
    }
  }
  
}
