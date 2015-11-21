//
//  ccOrgActivity.swift
//  iZknu_0.02
//
//  Created by Juno on 11/19/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import Foundation

public class ccOrgActivity: NSObject {
    var id = 0
    var headImageUrl = "" //活动图片
    var name = ""   //名称
    var place = ""  //地点
    var level = ""  //级别
    var peopleNow = 0 //目前人数
    var peopleMost = 0 //最多人数
    var summary = ""    //简介
    var department = "" // 举办院系
    var type = ""   //类型
    var holdTime = ""//举办时间
    var postTime = ""//发布时间
    var contractor = "" //承办单位
    var memberListId:[Int] = [] //成员id
    
    public init(headImageUrl: String?, name: String?, place: String?, level: String?, peopleNow: Int?, peopleMost: Int?, summary: String?, department: String?, type: String?, holdTime: String?, postTime: String?, contractor: String?, memberListId: [Int]) {

        self.headImageUrl = headImageUrl ?? ""
        self.name = name ?? ""
        self.place = place ?? ""
        
        self.level = level ?? ""
        self.peopleNow = peopleNow ?? 0
        self.peopleMost = peopleMost ?? 0
        self.summary = summary ?? ""
        self.department = department ?? ""
        self.type = type ?? ""
        self.holdTime = holdTime ?? ""
        self.postTime = postTime ?? ""
        self.contractor = contractor ?? ""
        self.memberListId = memberListId
        super.init()
    }
}