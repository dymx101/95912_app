//
//  PMSignCell.swift
//  Taasky
//
//  Created by DongYiming on 6/7/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class PMSignCell: UITableViewCell {
    
    @IBOutlet weak var textfieldUserName: UITextField!
    @IBOutlet weak var textfieldPwd: UITextField!
    @IBOutlet weak var btnSign: UIButton!
    @IBOutlet weak var btnSwitch: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        textfieldUserName.layer.cornerRadius = 2
        textfieldPwd.layer.cornerRadius = 2
    }

    @IBAction func actionSwitch(sender: AnyObject) {
        btnSign.selected = !btnSign.selected
    }
}
