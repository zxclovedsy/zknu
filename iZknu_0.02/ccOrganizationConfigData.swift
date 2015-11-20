//
//  ccOrganizationConfigData.swift
//  iZknu_0.02
//
//  Created by Juno on 11/19/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import Foundation
public class ccOrganizationConfigData {
    var organizationList = [Int: ccOrganization]()
    public func initConfigData() {
        let fileWapper = ccFileWapper(name:"OrganizationsXML", type:FileType.FileXML.rawValue)
        let xmlData: NSData = fileWapper.open()
        
        do {
            let doc = try GDataXMLDocument (data: xmlData, options: 0)
            
            let organizations = try doc.nodesForXPath("//Organization") as? [GDataXMLElement]
            for organization in organizations! {
                let id = organization.attributeForName("id").stringValue()
                
                let nameElement = organization.elementsForName("name")[0] as? GDataXMLElement
                let name = nameElement?.stringValue()
                
                let summaryElement = organization.elementsForName("summary")[0] as? GDataXMLElement
                let summary = summaryElement?.stringValue()
                
                
                var membersId: [Int] = []
                let membersElement = organization.elementsForName("members")[0] as? GDataXMLElement
                let memberElement = membersElement?.elementsForName("member") as? [GDataXMLElement]
                
                for index in memberElement! {
                    let id = Int(index.stringValue())
                    membersId.append(id!)
                }
                
                let scaleElement = organization.elementsForName("scale")[0] as? GDataXMLElement
                let scale = Int((scaleElement?.stringValue())!)
                
                let numberOfPeopleElement = organization.elementsForName("numberOfPeople")[0] as? GDataXMLElement
                let numberOfPeople = Int((numberOfPeopleElement?.stringValue())!)
                
                let departmentElement = organization.elementsForName("department")[0] as? GDataXMLElement
                let department = departmentElement?.stringValue()
                
                let recruitmentElement = organization.elementsForName("recruitment")[0] as? GDataXMLElement
                let recruitment = (recruitmentElement?.stringValue()) == "true"
                
                let levelElement = organization.elementsForName("level")[0] as? GDataXMLElement
                let level = levelElement?.stringValue()
                
                let headImageUrlElement = organization.elementsForName("headImageUrl")[0] as? GDataXMLElement
                let headImageUrl = headImageUrlElement?.stringValue()
                
                var photosUrl: [String] = []
                let photosUrlElement = organization.elementsForName("photos")[0] as? GDataXMLElement
                let photoUrlElement = photosUrlElement?.elementsForName("photo") as? [GDataXMLElement]
                
                for index in photoUrlElement! {
                    let photoUrl = index.stringValue()
                    photosUrl.append(photoUrl!)
                }
                
                let dataManager : ccOrgDataManager = ccOrgIF.sharedInstance.getDataManager() as! ccOrgDataManager
                var members: [Int: ccOrgMember] = [:]
                for id in membersId {
                    members.updateValue(dataManager.getMember(id)!, forKey: id)
                }
                
                let newOrganization = ccOrganization(name: name!, summary: summary!, memberList: members, scale: scale!, numberOfPeople: numberOfPeople!, department: department!, recruitment: recruitment, level: level!, headImageUrl: headImageUrl!, photosUrl: photosUrl)
                newOrganization.id = Int(id)!
                
                organizationList.updateValue(newOrganization, forKey: newOrganization.id)
            }
        } catch{}
    }
}
