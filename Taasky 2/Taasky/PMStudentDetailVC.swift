//
//  PMStudentDetailVC.swift
//  Taasky
//
//  Created by D. D. on 6/4/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class PMStudentDetailVC: UITableViewController {
    
    var student: PMStudent?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
    }


    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PMStudentDetailCell", forIndexPath: indexPath) as! PMStudentDetailCell

        cell.delegate = self

        return cell
    }


}

extension PMStudentDetailVC : PMStudentDetailCellDelegate {
    func presentVC(vc: UIViewController) {
        self.presentViewController(vc, animated: true, completion: nil)
        
        let hud = JGProgressHUD(style: .Dark)
        hud.textLabel.text = "加载中"
        hud.showInView(self.view)
        hud.dismissAfterDelay(1)
    }
    
//    func reloadWhenImagePicked() {
//        //self.tableView.reloadData()
//    }
}
