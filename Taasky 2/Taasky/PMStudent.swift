//
//  PMStudent.swift
//  Taasky
//
//  Created by D. D. on 6/2/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class PMStudent: AVObject {
    
    var studentID: Int = 0 {
        didSet {
            self.setObject(studentID, forKey: "studentID")
        }
    }
    
    var roomID: Int = 0 {
        didSet {
            self.setObject(roomID, forKey: "roomID")
        }
    }
    
    var name = "" {
        didSet {
            self.setObject(name, forKey: "name")
        }
    }
    
    var company = "" {
        didSet {
            self.setObject(company, forKey: "company")
        }
    }
    
    var address = "" {
        didSet {
            self.setObject(address, forKey: "address")
        }
    }
    
    var postcode = "" {
        didSet {
            self.setObject(postcode, forKey: "postcode")
        }
    }
    
    var mobile = "" {
        didSet {
            self.setObject(mobile, forKey: "mobile")
        }
    }
    
    var email = "" {
        didSet {
            self.setObject(email, forKey: "email")
        }
    }
    
    var qq = "" {
        didSet {
            self.setObject(qq, forKey: "qq")
        }
    }
    
    var avatar_small = "" {
        didSet {
            self.setObject(avatar_small, forKey: "avatar_small")
        }
    }
    
    var avatar_large = "" {
        didSet {
            self.setObject(avatar_large, forKey: "avatar_large")
        }
    }
    
    
    // MARK: methods
    static func createStudent(name: String, studentID: Int) -> PMStudent {
        let student = PMStudent(className: "PMStudent")
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
    
    func update(object: AVObject) {
        self.studentID = object.objectForKey("studentID").integerValue
        self.roomID = object.objectForKey("roomID").integerValue
        self.name = object.objectForKey("name").stringValue
        self.company = object.objectForKey("company").stringValue
        self.address = object.objectForKey("address").stringValue
        self.postcode = object.objectForKey("postcode").stringValue
        self.mobile = object.objectForKey("mobile").stringValue
        self.email = object.objectForKey("email").stringValue
        self.qq = object.objectForKey("qq").stringValue
        self.avatar_small = object.objectForKey("avatar_small").stringValue
        self.avatar_large = object.objectForKey("avatar_large").stringValue
    }
    
    static func getAllStudents() -> NSArray {
        let query = AVQuery(className: "PMStudent")
        var error:NSErrorPointer = nil
        let students = query.findObjects(error) as NSArray
        
        return students
    }
}
