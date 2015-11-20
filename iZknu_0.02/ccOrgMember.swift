//
//  ccOrgMember.swift
//  ccOrgCore
//
//  Created by Juno on 11/18/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import Foundation

public class ccOrgMember: NSObject {
    var id:Int = 0  
    var name: String
    var headImage: String = ""
    var grade: String
    var college: String
    var department: String = ""
    var job: String = ""
    
    public init(name: String, grade: String, college: String) {
        self.name = name
        self.grade = grade
        self.college = college
        
        super.init()
    }
    
    public init(name: String, headImage: String, grade: String, college: String, department: String, job: String) {
        self.name = name
        self.headImage = headImage
        self.grade = grade
        self.college = college
        self.department = department
        self.job = job
        super.init()
    }
}