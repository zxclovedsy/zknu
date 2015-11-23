//
//  ccOrgActivityConfigData.swift
//  iZknu_0.02
//
//  Created by Juno on 11/21/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import Foundation

public class ccOrgActivityConfigData {
    var activityList = [Int: ccOrgActivity]()
    public func initConfigData() {
        let fileWapper = ccFileWapper(name:"Cache/ActivitiesXML", type:FileType.FileXML.rawValue)
        let xmlData: NSData = fileWapper.open()
        
        do {
            let doc = try GDataXMLDocument (data: xmlData, options: 0)
            
            let activities = try doc.nodesForXPath("//OrgActivity") as? [GDataXMLElement]
            for activity in activities! {
                //id
                let id = activity.attributeForName("id").stringValue()
                //活动图片
                let headImageUrlElement = activity.elementsForName("headImageUrl")[0] as? GDataXMLElement
                var headImageUrl = ""
                if let url = headImageUrlElement!.stringValue() {
                    headImageUrl = "Cache/\(url)"
                }
                //名称
                let nameElement = activity.elementsForName("name")[0] as? GDataXMLElement
                let name = nameElement?.stringValue()
                //地点
                let placeElement = activity.elementsForName("place")[0] as? GDataXMLElement
                let place = placeElement?.stringValue()
                //级别
                let levelElement = activity.elementsForName("level")[0] as? GDataXMLElement
                let level = levelElement?.stringValue()
                //目前人数
                let peopleNowElement = activity.elementsForName("peopleNow")[0] as? GDataXMLElement
                let peopleNow = Int((peopleNowElement?.stringValue())!)
                //最多人数
                let peopleMostElement = activity.elementsForName("peopleMost")[0] as? GDataXMLElement
                let peopleMost = Int((peopleMostElement?.stringValue())!)
                //简介
                let summaryElement = activity.elementsForName("summary")[0] as? GDataXMLElement
                let summary = summaryElement?.stringValue()
                //举办院系
                let collegeElement = activity.elementsForName("college")[0] as? GDataXMLElement
                let college = collegeElement?.stringValue()
                //类型
                let typeElement = activity.elementsForName("type")[0] as? GDataXMLElement
                let type = typeElement?.stringValue()
                //举办时间
                let holdTimeElement = activity.elementsForName("holdTime")[0] as? GDataXMLElement
                let holdTime = holdTimeElement?.stringValue()
                //发布时间
                let postTimeElement = activity.elementsForName("postTime")[0] as? GDataXMLElement
                let postTime = postTimeElement?.stringValue()
                //承办单位
                let contractorElement = activity.elementsForName("contractor")[0] as? GDataXMLElement
                let contractor = contractorElement?.stringValue()
                //成员id
                var membersId: [Int] = []
                let membersElement = activity.elementsForName("members")[0] as? GDataXMLElement
                let memberElement = membersElement?.elementsForName("member") as? [GDataXMLElement]
                for index in memberElement! {
                    let id = Int(index.stringValue())
                    if id != nil {
                        membersId.append(id!)
                    }
                }

                let newActivity = ccOrgActivity(headImageUrl: headImageUrl, name: name, place: place, level: level, peopleNow: peopleNow, peopleMost: peopleMost, summary: summary, college: college, type: type, holdTime: holdTime, postTime: postTime, contractor: contractor, memberListId: membersId)
                newActivity.id = Int(id)!
                
                activityList.updateValue(newActivity, forKey: newActivity.id)                
            }
        } catch{}
    }
}