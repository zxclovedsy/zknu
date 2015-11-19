//
//  ccOrgDataManager.swift
//  ccOrgCore
//
//  Created by Juno on 11/18/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import Foundation

class ccOrgDataManager: ccDataManager {
    var configDataMember: ccMemberConfigData!
    init() {
        configDataMember = ccMemberConfigData()
        self.InitConfigData()
    }
    private func InitConfigData() {
        configDataMember.initConfigData()
    }
    func getMember(id: Int) -> ccOrgMember? {
        return configDataMember.memberList[id]
    }
}