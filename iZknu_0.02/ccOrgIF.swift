//
//  ccOrgIF.swift
//  ccOrgCore
//
//  Created by Juno on 11/18/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import Foundation

class ccOrgIF: ccIF {
    static let sharedInstance = ccOrgIF()
    private let dataManager: ccOrgDataManager
    private init() {
        self.dataManager = ccOrgDataManager()
    }
    func getDataManager() -> ccDataManager {
        return self.dataManager
    }
}