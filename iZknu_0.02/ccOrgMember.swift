//
//  ccOrgMember.swift
//  ccOrgCore
//
//  Created by Juno on 11/18/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import Foundation

public class ccOrgMember: NSObject {
    var id = 0
    var studentId = "" //学号
    var name = ""
    var headImageUrl = " " //头像
    var grade = ""  //年级
    var college = "" //学院
    //var department = "" //部门
    //var job = "" //职位
    var activitiesId = [Int]()
    var organizationsId = [Int]()
    var organizationsFollowed = [Int]()
    
    public init(name: String, grade: String, college: String) {
        self.name = name
        self.grade = grade
        self.college = college
        
        super.init()
    }
    
    public init(name: String?, studentId: String?, headImageUrl: String?, grade: String?, college: String?, activitiesId: [Int], organizationsId: [Int], organizationsFollowed: [Int]) {
        self.name = name ?? " "
        self.studentId = studentId ?? ""
        self.headImageUrl = headImageUrl ?? " "
        self.grade = grade ?? " "
        self.college = college ?? " "
        self.activitiesId = activitiesId
        self.organizationsId = organizationsId
        self.organizationsFollowed = organizationsFollowed
        super.init()
    }
}