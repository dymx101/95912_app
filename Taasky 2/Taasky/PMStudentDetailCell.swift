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
    
    @IBOutlet weak var btnAvatar: UIButton!
    @IBOutlet weak var lblName: UILabel!
    
    var delegate: PMStudentDetailCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None
        
        btnAvatar.layer.cornerRadius = 50
        btnAvatar.clipsToBounds = true
        btnAvatar.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
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
            btnAvatar.setImage(image, forState: .Normal)
            
            delegate?.saveAvatar(image)
        }
    }
}
