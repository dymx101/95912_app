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
    
    var students: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PMStudent.getAllStudents({ (results, error) -> Void in
            self.students = results as NSArray
            
            self.collectionView.reloadData()
        })
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

extension PMStudentsVC : UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if students != nil {
            return students.count
        }
        
        return Int(0)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PMStudentCollectCell", forIndexPath: indexPath) as! PMStudentCollectCell
        
        if (students != nil && students.count > 0) {
            if let studentData = students[indexPath.row] as? AVObject {
                let student = PMStudent.createStudent(studentData)
                cell.lblName.text = student.name
            }
        }
        
        return cell
    }
}

extension PMStudentsVC : UICollectionViewDelegate {
    
     func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if let studentData = students[indexPath.row] as? AVObject {
            let student = PMStudent.createStudent(studentData)
            
            let vc = UIStoryboard.mainBoard().studentDetailVC() as! PMStudentDetailVC
            vc.student = student
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
