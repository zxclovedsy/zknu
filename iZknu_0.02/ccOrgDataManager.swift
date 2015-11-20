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
    var configDataOrganization: ccOrganizationConfigData!
    init() {
        configDataMember = ccMemberConfigData()
        configDataOrganization = ccOrganizationConfigData()
        self.InitConfigData()
    }
    private func InitConfigData() {
        configDataMember.initConfigData()
        configDataOrganization.initConfigData()
    }
    func getMember(id: Int) -> ccOrgMember? {
        return configDataMember.memberList[id]
    }
    func getOrganization(id: Int) -> ccOrganization? {
        return configDataOrganization.organizationList[id]
    }
}