//
//  PMStudentDetailCell.swift
//  Taasky
//
//  Created by D. D. on 6/4/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

protocol PMStudentDetailCellDelegate {
    func presentVC(vc: UIViewController)
    func saveAvatar(image: UIImage)
//    func reloadWhenImagePicked()
}

class PMStudentDetailCell: UITableViewCell {
    
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var btnAvatar: UIButton!
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var btnSMS: UIButton!
    
    var delegate: PMStudentDetailCellDelegate?

    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.selectionStyle = .None
        
        ivAvatar.layer.cornerRadius = 50
        ivAvatar.clipsToBounds = true
//        btnSMS.layer.cornerRadius = 32
//        btnSMS.clipsToBounds = true
//        btnAvatar.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
//        self.contentView.setTranslatesAutoresizingMaskIntoConstraints(false)

    }
    
    @IBAction func actionChangeAvatar(sender: AnyObject) {
        let picker = UzysAssetsPickerController()
        picker.delegate = self
        picker.maximumNumberOfSelectionMedia = 1
        
        delegate?.presentVC(picker)

    }

}

extension PMStudentDetailCell : UzysAssetsPickerControllerDelegate {
    func uzysAssetsPickerController(picker: UzysAssetsPickerController!, didFinishPickingAssets assets: [AnyObject]!) {
        
        let array = assets as NSArray
        if array.count > 0 {
            let asset = array.firstObject as! ALAsset
            var image = PMObjcUtil.imageFromALAsset(asset)
            ivAvatar.image = image
            
            delegate?.saveAvatar(image)
        }
    }
}
