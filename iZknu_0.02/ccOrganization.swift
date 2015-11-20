//
//  ccOrganization.swift
//  ccOrgCore
//
//  Created by Juno on 11/18/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import Foundation

public class ccOrganization: NSObject {
    var id =  0
    var name = ""//名称
    var summary = "" //简介
    var membersId =  [Int]() //成员id
    var scale = 0 //规模
    var numberOfPeople = 0 //人数
    var department = "" // 部门
    var recruitment = false //是否招新
    var level = "" //级别
    var headImageUrl = "" //头像路径
    var photosUrl: [String] = [] //相册区
    
    public init(name: String, summary: String, membersId: [Int], scale: Int, numberOfPeople: Int, department: String, recruitment: Bool, level: String, headImageUrl: String, photosUrl: [String]) {
        self.name = name
        self.summary = summary
        self.membersId = membersId
        self.scale = scale
        self.numberOfPeople = numberOfPeople
        self.department = department
        self.recruitment = recruitment
        self.level = level
        self.headImageUrl = headImageUrl
        self.photosUrl = photosUrl
        super.init()
    }
    
    
    /*public func addOrgMember(newMember: ccOrgMember) -> Bool {
        if memberList.indexForKey(newMember.id) == nil {
            memberList.updateValue(newMember, forKey: newMember.id)
            return true
        }
        return false
    }
    
    public func deleteOrgMember(id: Int) -> Bool {
        if memberList.indexForKey(id) == nil {
            return false
        } else {
          memberList.removeValueForKey(id)
            return true
        }
    }
    
    public func getOrgMember(id: Int) -> ccOrgMember? {
        if memberList.indexForKey(id) == nil {
            return nil
        } else {
            return memberList[id]
        }
    }*/
    
}