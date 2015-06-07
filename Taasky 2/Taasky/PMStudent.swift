//
//  PMStudent.swift
//  Taasky
//
//  Created by D. D. on 6/2/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class PMStudent: NSObject {
    
    override init() {
        super.init()
        data = AVObject(className: "PMStudent")
    }
    
    var studentID: Int = 0 {
        didSet {
            data?.setObject(studentID, forKey: "studentID")
        }
    }
    
    var roomID: Int = 0 {
        didSet {
            data?.setObject(roomID, forKey: "roomID")
        }
    }
    
    var name = "" {
        didSet {
            data?.setObject(name, forKey: "name")
        }
    }
    
    var company = "" {
        didSet {
            data?.setObject(company, forKey: "company")
        }
    }
    
    var address = "" {
        didSet {
            data?.setObject(address, forKey: "address")
        }
    }
    
    var postcode = "" {
        didSet {
            data?.setObject(postcode, forKey: "postcode")
        }
    }
    
    var mobile = "" {
        didSet {
            data?.setObject(mobile, forKey: "mobile")
        }
    }
    
    var email = "" {
        didSet {
            data?.setObject(email, forKey: "email")
        }
    }
    
    var qq = "" {
        didSet {
            data?.setObject(qq, forKey: "qq")
        }
    }
    
    var avatar_small: String? = "" {
        didSet {
            data?.setObject(avatar_small, forKey: "avatar_small")
        }
    }
    
    var avatar_large: String? = "" {
        didSet {
            data?.setObject(avatar_large, forKey: "avatar_large")
        }
    }
    
    var data:AVObject? {
        didSet {
           update(data)
        }
    }
    
    var avatarLargeImage: UIImage?
    var avatarLargeFile: AVFile?
    var avatarLargeURL: String?
    
    // MARK: methods
    static func createStudent(name: String, studentID: Int) -> PMStudent {
        let student = PMStudent()
        student.studentID = studentID
        student.name = name
        
        student.roomID = 0
        student.company = ""
        student.address = ""
        student.postcode = ""
        student.mobile = ""
        student.email = ""
        student.qq = ""
        student.avatar_small = ""
        student.avatar_large = ""
        
        return student
    }
    
    static func createStudent(object: AVObject) -> PMStudent {
        let student = PMStudent()
        student.data = object
        return student
    }
    
    static func getAllStudents() -> NSArray {
        let query = AVQuery(className: "PMStudent")
        var error:NSErrorPointer = nil
        
        let studentsData: [AnyObject]! = query.findObjects(error)
        if studentsData != nil {
            return studentsData as NSArray
        }
        
        return NSArray()
    }
    
    static func getAllStudents(block: AVArrayResultBlock) {
        let query = AVQuery(className: "PMStudent")

        query.findObjectsInBackgroundWithBlock { (array, error) -> Void in
            
            if array != nil {
                let arr = array as NSArray
                
                var modeledArr = NSMutableArray()
                arr.enumerateObjectsUsingBlock({ (object, idx, stop) -> Void in
                    if let object = object as? AVObject {
                        let stu = PMStudent.createStudent(object)
                        modeledArr.addObject(stu)
                    }
                })
                
                block(modeledArr as [AnyObject], error)
            }
        }
    }
    
    // MARK:
    func update(object_: AVObject?) {
        if let object = object_ {
            self.studentID = object.objectForKey("studentID").integerValue
            self.roomID = object.objectForKey("roomID").integerValue
            self.name = object.objectForKey("name") as! String
            self.company = object.objectForKey("company") as! String
            self.address = object.objectForKey("address") as! String
            self.postcode = object.objectForKey("postcode") as! String
            self.mobile = object.objectForKey("mobile") as! String
            self.email = object.objectForKey("email") as! String
            self.qq = object.objectForKey("qq") as! String
            self.avatar_small = object.objectForKey("avatar_small") as? String
            self.avatar_large = object.objectForKey("avatar_large") as? String
        }
    }
    
    func loadLargeAvatar(refresh: Bool, completion:(image: UIImage!) -> Void) {
        
        if (!refresh && avatarLargeImage != nil) {
            completion(image: avatarLargeImage)
            return
        }
        
        var canLoadFile = false
        
        if let str = avatar_large {
            
            if (count(str) > 0) {
                
                let canLoadFile = true
                
                AVFile.getFileWithObjectId(avatar_large, withBlock: { (file, error) -> Void in
                    if file != nil {
                        file.getDataInBackgroundWithBlock({ (data, error) -> Void in
                            if data != nil {
                                let image = UIImage(data: data, scale: UIScreen.mainScreen().scale)
                                if let image_ = image {
                                    self.avatarLargeImage = image_
                                    completion(image: image_)
                                }
                            }
                        })
                    }
                })
            }
            
        }

        if (!canLoadFile) {
            completion(image: UIImage(named: "avatar_sample")!)
        }
    }
    
    func loadLargeAvatarFile(refresh: Bool, completion:(file: AVFile!) -> Void) {
        
        if (!refresh && avatarLargeFile != nil) {
            completion(file: avatarLargeFile)
            return
        }
        
        var canLoadFile = false
        
        if let str = avatar_large {
            
            if (count(str) > 0) {
                
                canLoadFile = true
                
                AVFile.getFileWithObjectId(avatar_large, withBlock: { (file, error) -> Void in
                    completion(file: file)
                })
            }
            
        }
        
        if (!canLoadFile) {
            completion(file: nil)
        }
    }
}
