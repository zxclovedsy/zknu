//
//  ccFileWapper.swift
//  ccCore
//
//  Created by Juno on 11/18/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import Foundation

public enum FileType: String {
    case FileXML = "xml"
    case FileJson = "json"
    case FilePng = "png"
}

public class ccFileWapper {
    var m_sType:String!
    var m_sName:String!
    var m_nsData:NSData!
    
    private init() {}
    
    public init(name:String, type:String) {
        self.m_sName = name
        self.m_sType = type
    }
    
    
    public func open()-> NSData  {
        //获取xml文件路径
        let path : String? = NSBundle.mainBundle().pathForResource(self.m_sName, ofType:self.m_sType)
        //获取xml文件内容
        m_nsData = NSData(contentsOfFile:path!)
        
        return m_nsData
    }
}