//
//  woDeGuanZhuTableViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 11/22/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class woDeGuanZhuTableViewController: woDeSuperTableViewController {
    
    var organizationList =  [Int: ccOrganization]()
    var ids = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "关注的社团"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: self, action: "")
        let dtMgr = ccOrgIF.sharedInstance.getDataManager() as! ccOrgDataManager
        for key in me.organizationsFollowed {
            if let value = dtMgr.getOrganization(key) {
                organizationList.updateValue(value, forKey: key)
            }
        }
        ids = Array(organizationList.keys)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return organizationList.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = SheTuanTableViewCell()
        let id = ids[indexPath.row]
        cell.organization = organizationList[id]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let id = ids[indexPath.row]
        let organization = organizationList[id]
        let viewController = SheTuanViewController()
        viewController.organization  = organization
        viewController.leftButtonEnabled = false
        self.navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
