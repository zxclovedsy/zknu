//
//  ccSingleton.swift
//  ccCore
//
//  Created by Juno on 11/18/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import Foundation

public class ccSingleton {
    static let sharedInstance =  ccSingleton()
    private init() {}
}