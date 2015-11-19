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
        let fileWapper = ccFileWapper(name:"testXML", type:FileType.FileXML.rawValue)
        let xmlData: NSData = fileWapper.open()
        
        do {
            let doc = try GDataXMLDocument (data: xmlData, options: 0)
            let users = try doc.nodesForXPath("//OrgMember") as? [GDataXMLElement]
            for user in users! {
                let id = user.attributeForName("id").stringValue()
                let nameElement = user.elementsForName("name")[0] as? GDataXMLElement
                let name = nameElement?.stringValue()
                let ageElement = user.elementsForName("grade")[0] as? GDataXMLElement
                let grade = ageElement?.stringValue()
                
                let newMember = ccOrgMember(name: name!, grade: grade!, college: "")
                newMember.id = Int(id)!
                memberList.updateValue(newMember, forKey: newMember.id)
            }
        } catch{}
    }
}