//
//  PMStudentsVC.swift
//  Taasky
//
//  Created by DongYiming on 6/2/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class PMStudentsVC: UICollectionViewController {
    
    
    var numberPerRow: Int = 3
    
    var students: NSArray!
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleProfileChanged:", name: notify_student_profile_changed, object: nil)
        
        
//        self.title = "成员"
        self.navigationItem.title = "班级成员"
        
        PMStudent.getAllStudents({ (results, error) -> Void in
            
            self.students = results as NSArray
            
            self.students = self.students.sortedArrayUsingComparator({ (stu1, stu2) -> NSComparisonResult in
                if let stu1_ = stu1 as? PMStudent {
                    if let stu2_ = stu2 as? PMStudent {
                        
                        let result = stu1_.studentID > stu2_.studentID
                        
                        return NSComparisonResult(rawValue: Int(result))!
                        
                    }
                }
                
                return NSComparisonResult.OrderedAscending
            })
            
            self.collectionView?.reloadData()
        })
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let currentUser = AVUser.currentUser() {
            
        } else {
            self.performSegueWithIdentifier("segue_contacts2sign", sender: self)
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let collectionWidth = CGRectGetWidth(collectionView!.bounds)

        let insets = layout.sectionInset.left + layout.sectionInset.right
        let spacing = layout.minimumLineSpacing * CGFloat(numberPerRow + 1)
        let width = (collectionWidth - insets - spacing) / CGFloat(numberPerRow)
        layout.itemSize = CGSizeMake(width, 128)
    }
    
    
    func handleProfileChanged(note: NSNotification) {
        if note.name == notify_student_profile_changed {
            if let student = note.object as? PMStudent {
                students.enumerateObjectsUsingBlock({ (stu, idx, stop) -> Void in
                    if student.studentID == (stu as! PMStudent).studentID {
                        self.collectionView?.reloadItemsAtIndexPaths([NSIndexPath(forRow: idx, inSection: 0)])
                        stop.memory = true
                    }
                })
            }
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "segue_contacts2sign") {
            if let vc = segue.destinationViewController as? PMSignVC {
                
            }
        }
    }

}

extension PMStudentsVC : UICollectionViewDataSource {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if students != nil {
            return students.count
        }
        
        return Int(0)
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PMStudentCollectCell", forIndexPath: indexPath) as! PMStudentCollectCell
        
        if (students != nil && students.count > 0) {
            if let studentData = students[indexPath.row] as? PMStudent {
//                let student = PMStudent.createStudent(studentData)
                cell.lblName.text = studentData.name

//                studentData.loadLargeAvatar(false) { (image) -> Void in
//                    cell.ivAvatar.image = image
//                }
                
                if let urlStr = studentData.avatarLargeURL {
                    cell.ivAvatar.sd_setImageWithURL(NSURL(string: urlStr), placeholderImage: avatar_default_image)
                } else {
                    studentData.loadLargeAvatarFile(false, completion: { (file) -> Void in
                        
                        if (file != nil) {
                            studentData.avatarLargeURL = file.url
                            let url = NSURL(string: file.url)
                            
                            cell.ivAvatar.sd_setImageWithURL(url, placeholderImage: avatar_default_image)
                        }
                        
                    })
                }
                
            }
        }
        
        return cell
    }
}

extension PMStudentsVC : UICollectionViewDelegate {
    
     override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if let studentData = students[indexPath.row] as? PMStudent {
//            let student = PMStudent.createStudent(studentData)
            
            let vc = UIStoryboard.mainBoard().studentDetailVC() as! PMStudentDetailVC
            vc.student = studentData
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
