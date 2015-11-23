//
//  ccMemberConfigData.swift
//  ccOrgCore
//
//  Created by Juno on 11/18/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import Foundation

public class ccMemberConfigData {
    var memberList = [Int: ccOrgMember]()
    public func initConfigData() {
        let fileWapper = ccFileWapper(name:"Cache/MembersXML", type:FileType.FileXML.rawValue)
        let xmlData: NSData = fileWapper.open()
        
        do {
            let doc = try GDataXMLDocument (data: xmlData, options: 0)
            let members = try doc.nodesForXPath("//OrgMember") as? [GDataXMLElement]
            for member in members! {
                //id
                let id = member.attributeForName("id").stringValue()
                //studentid
                let studentIdElement = member.elementsForName("studentId")[0] as? GDataXMLElement
                let studentId = studentIdElement?.stringValue()
                //name
                let nameElement = member.elementsForName("name")[0] as? GDataXMLElement
                let name = nameElement?.stringValue()
                //headImage
                let headImageUrlElement = member.elementsForName("headImageUrl")[0] as? GDataXMLElement
                let headImageUrl = headImageUrlElement?.stringValue()
                //grade
                let gradeElement = member.elementsForName("grade")[0] as? GDataXMLElement
                let grade = gradeElement?.stringValue()
                //college
                let collegeElement = member.elementsForName("college")[0] as? GDataXMLElement
                let college = collegeElement?.stringValue()
                //activityId
                var activitiesId: [Int] = []
                let activitiesIdElement = member.elementsForName("activitiesId")[0] as? GDataXMLElement
                let activityIdElement = activitiesIdElement?.elementsForName("activityId") as? [GDataXMLElement]
                
                for index in activityIdElement! {
                    if let id = Int(index.stringValue()) {
                        activitiesId.append(id)
                    }
                }
                
                //organizationsId
                var organizationsId: [Int] = []
                let organizationsIdElement = member.elementsForName("organizationsId")[0] as? GDataXMLElement
                let organizationIdElement = organizationsIdElement?.elementsForName("organizationId") as? [GDataXMLElement]
                
                for index in organizationIdElement! {
                    if let id = Int(index.stringValue()){
                        organizationsId.append(id)
                    }
                }
                
                //organizationsFollowed
                var organizationsFollowed: [Int] = []
                let organizationsFollowedElement = member.elementsForName("organizationsFollowed")[0] as? GDataXMLElement
                let organizationFollowedElement = organizationsFollowedElement?.elementsForName("organizationFollowed") as? [GDataXMLElement]
                
                for index in organizationFollowedElement! {
                    if let id = Int(index.stringValue()) {
                        organizationsFollowed.append(id)
                    }
                }

                let newMember = ccOrgMember(name: name, studentId: studentId, headImageUrl: headImageUrl, grade: grade, college: college, activitiesId: activitiesId, organizationsId: organizationsId, organizationsFollowed: organizationsFollowed)
                newMember.id = Int(id)!
                memberList.updateValue(newMember, forKey: newMember.id)
            }
        } catch{}

    }
}