//
//  AppDelegate.swift
//  Taasky
//
//  Created by Audrey M Tam on 18/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

    UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    
    AVOSCloud.setApplicationId("pg1lj49lhnhv6p13h83a5cx3n23y1r2779umy3ul69flymj5", clientKey: "yh4rkt4hb3s2umq1jbnipk3w9f35u3zq09hauwcst80njn85")
    
    
//    let testObject = AVObject(className: "TestObject")
//    testObject.setObject("bar", forKey: "foo")
//    testObject.save()
    
    let students = PMStudent.getAllStudents()
    if (students.count == 0) {
        
        initStudents()
        
    } else {
        print(students)
    }
    
    return true
  }
    
    // Caution: this method will override whatever data currently saved
    func initStudents() {
        var newStudents: [PMStudent] = []
        
        newStudents.append(PMStudent.createStudent("朱建玲", studentID: 1))
        newStudents.append(PMStudent.createStudent("杨怡", studentID: 2))
        newStudents.append(PMStudent.createStudent("周莉", studentID: 3))
        newStudents.append(PMStudent.createStudent("田丹丹", studentID: 4))
        newStudents.append(PMStudent.createStudent("薛新峰", studentID: 5))
        newStudents.append(PMStudent.createStudent("李红", studentID: 6))
        newStudents.append(PMStudent.createStudent("冷雪浩", studentID: 7))
        newStudents.append(PMStudent.createStudent("王晓川", studentID: 8))
        newStudents.append(PMStudent.createStudent("章卫忠", studentID: 9))
        
        newStudents.append(PMStudent.createStudent("陈晓敏", studentID: 10))
        newStudents.append(PMStudent.createStudent("查明高", studentID: 11))
        newStudents.append(PMStudent.createStudent("陈世武", studentID: 12))
        newStudents.append(PMStudent.createStudent("封亚勇", studentID: 13))
        newStudents.append(PMStudent.createStudent("崔永", studentID: 14))
        newStudents.append(PMStudent.createStudent("余青松", studentID: 15))
        newStudents.append(PMStudent.createStudent("王长波", studentID: 16))
        newStudents.append(PMStudent.createStudent("阮鸥", studentID: 17))
        newStudents.append(PMStudent.createStudent("贺能", studentID: 18))
        newStudents.append(PMStudent.createStudent("马四祥", studentID: 19))
        
        newStudents.append(PMStudent.createStudent("邱拥军", studentID: 20))
        newStudents.append(PMStudent.createStudent("唐密", studentID: 21))
        newStudents.append(PMStudent.createStudent("向晋龙", studentID: 22))
        newStudents.append(PMStudent.createStudent("周若来", studentID: 23))
        newStudents.append(PMStudent.createStudent("董一鸣", studentID: 24))
        newStudents.append(PMStudent.createStudent("谢臻", studentID: 25))
        newStudents.append(PMStudent.createStudent("郑小斌", studentID: 26))
        newStudents.append(PMStudent.createStudent("李涛鹏", studentID: 27))
        newStudents.append(PMStudent.createStudent("向睿", studentID: 28))
        newStudents.append(PMStudent.createStudent("孙云", studentID: 29))
        
        newStudents.append(PMStudent.createStudent("高向鹏", studentID: 30))
        newStudents.append(PMStudent.createStudent("张劲涛", studentID: 31))
        newStudents.append(PMStudent.createStudent("董魁", studentID: 32))
        newStudents.append(PMStudent.createStudent("王丽", studentID: 33))
        newStudents.append(PMStudent.createStudent("李海京", studentID: 34))
        
        for student in newStudents {
            student.save()
        }
    }
  
  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
  
  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  
}

