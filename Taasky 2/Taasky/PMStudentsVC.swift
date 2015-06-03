//
//  PMStudentsVC.swift
//  Taasky
//
//  Created by DongYiming on 6/2/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class PMStudentsVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var numberPerRow: Int = 3

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let collectionWidth = CGRectGetWidth(collectionView.bounds)

        let insets = layout.sectionInset.left + layout.sectionInset.right
        let spacing = layout.minimumLineSpacing * CGFloat(numberPerRow + 1)
        let width = (collectionWidth - insets - spacing) / CGFloat(numberPerRow)
        layout.itemSize = CGSizeMake(width, 128)
    }

}

extension PMStudentsVC:UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 34
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PMStudentCollectCell", forIndexPath: indexPath) as! PMStudentCollectCell
        
        
        
        return cell
    }
}
