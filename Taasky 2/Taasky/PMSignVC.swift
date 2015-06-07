//
//  PMSignVC.swift
//  Taasky
//
//  Created by DongYiming on 6/7/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class PMSignVC: UITableViewController {
    
    var tfUserName: UITextField?
    var tfPwd: UITextField?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 400
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PMSignCell", forIndexPath: indexPath) as! PMSignCell

        cell.btnSign.addTarget(self, action: "actionSignUp:", forControlEvents: .TouchUpInside)
        tfUserName = cell.textfieldUserName
        tfPwd = cell.textfieldPwd

        return cell
    }


    func actionSignUp(sender: UIButton) {
        println("sign up")
        if let username = tfUserName?.text {
            if let pwd = tfPwd?.text {
                
                let user = AVUser()
                user.username = username
                user.password = pwd
                
                if (sender.selected) {
                    
                    AVUser.logInWithUsernameInBackground(username, password: pwd, block: { (user, error) -> Void in
                        if (user != nil) {
                            
                            self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
                            
                        } else {
                            
                            let hud = JGProgressHUD(style: .Light)
                            hud.indicatorView = JGProgressHUDErrorIndicatorView()
                            hud.textLabel.text = "登陆失败，请检查用户名密码是否正确"
                            hud.showInView(self.view)
                            hud.dismissAfterDelay(2)
                            
                        }
                    })
                    
                } else {
                    
                    
                    
                    user.signUpInBackgroundWithBlock({ (success, error) -> Void in
                        if (success) {
                            
                            let hud = JGProgressHUD(style: .Light)
                            hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                            hud.textLabel.text = "注册成功"
                            hud.showInView(self.view)
                            hud.dismissAfterDelay(2)
                            
                            self.tfUserName?.text = ""
                            self.tfPwd?.text = ""
                            
                        } else {
                            
                            let hud = JGProgressHUD(style: .Light)
                            hud.indicatorView = JGProgressHUDErrorIndicatorView()
                            hud.textLabel.text = error?.domain
                            hud.showInView(self.view)
                            hud.dismissAfterDelay(2)
                            
                        }
                    })
                    
                }
            }
        }
    }
}
