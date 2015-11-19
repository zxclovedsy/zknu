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
    var name = ""
    var summary = "" //简介
    var memberList =  [Int: ccOrgMember]()
    
    public init(name: String, summary: String) {
        self.name = name
        self.summary = summary
        super.init()
    }
    
    
    public func addOrgMember(newMember: ccOrgMember) -> Bool {
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
    }
    
}