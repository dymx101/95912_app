//
//  PMSettingsVC.swift
//  Taasky
//
//  Created by DongYiming on 6/7/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class PMSettingsVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("logoutCell", forIndexPath: indexPath) as! UITableViewCell

        let btnLogout = cell.contentView.subviews.first as? UIButton
        btnLogout?.removeTarget(nil, action: nil, forControlEvents: .TouchUpInside)
        btnLogout?.addTarget(self, action: "actionLogout", forControlEvents: .TouchUpInside)

        return cell
    }


    func actionLogout() {
        AVUser.logOut()
        self.tabBarController?.selectedIndex = 0
    }
}
