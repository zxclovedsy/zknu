//
//  woDeHuoDongTableViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 11/22/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class woDeHuoDongTableViewController: woDeSuperTableViewController {
    

    var activityList =  [Int: ccOrgActivity]()
    var ids = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的活动"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: self, action: "")
        let dtMgr = ccOrgIF.sharedInstance.getDataManager() as! ccOrgDataManager
        for key in me.activitiesId {
            if let value = dtMgr.getActivity(key) {
                activityList.updateValue(value, forKey: key)
            }
        }
        ids = Array(activityList.keys)
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
        return activityList.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = HuoDongTableViewCell()
        let id = ids[indexPath.row]
        cell.activity = activityList[id]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let id = ids[indexPath.row]
        let activity = activityList[id]
        let viewController = HuoDongViewController()
        viewController.activity = activity
        viewController.buttonEnable = false
        self.navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
