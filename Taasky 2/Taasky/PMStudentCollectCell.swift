//
//  PMStudentCollectCell.swift
//  Taasky
//
//  Created by D. D. on 6/3/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class PMStudentCollectCell: UICollectionViewCell {
    
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    
    override func awakeFromNib() {
        ivAvatar.layer.cornerRadius = 40
        ivAvatar.clipsToBounds = true
        ivAvatar.layer.borderColor = UIColor.whiteColor().CGColor
        ivAvatar.layer.borderWidth = 3
    }
}
