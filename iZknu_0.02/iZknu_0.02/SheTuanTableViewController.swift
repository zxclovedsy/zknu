//
//  SheTuanTableViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 10/22/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class SheTuanTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var toolBar: UIToolbar!
    
    
    override func viewDidLoad() {
        let tableViewY: CGFloat = 40
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "社团"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: self, action: "")
        // tableView
        self.tableView = UITableView(frame: CGRect(x: 0, y: tableViewY, width: self.view.frame.width, height: self.view.frame.height))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(tableView)
        setupToolBar()
    }
    
    
    
    // MARK: -UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "testCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cellIdentifier")
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.navigationController?.pushViewController(SheTuanViewController(), animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    // MARK: Actions
    
    func setupToolBar() {
        
        let toolBarHeight: CGFloat = 40
        let toolBarY: CGFloat = 60
        // 修复tableView 顶部被 toolbar 覆盖
        self.toolBar = UIToolbar(frame: CGRect(x: 0, y: toolBarY, width: self.view.frame.width, height: toolBarHeight))
        self.toolBar.tintColor = UIColor.blackColor()
        
        let leiXingBarButtonItem = UIBarButtonItem(title: "分类 V", style: .Plain, target: self, action: "fenLeiBarButtonItemTapped:")
        let yuanXiBarButtonItem = UIBarButtonItem(title: "院系 V", style: .Plain, target: self, action: "yuanXiBarButtonItemTapped:")
        let shiJianBarButtonItem = UIBarButtonItem(title: "招新 V", style: .Plain, target: self, action: "zhaoXinBarButtonItemTapped:")
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        self.toolBar.items = [
            leiXingBarButtonItem,
            flexibleSpace,
            yuanXiBarButtonItem,
            flexibleSpace,
            shiJianBarButtonItem
        ]
        
        
        self.view.addSubview(toolBar)
        
    }
    
    func fenLeiBarButtonItemTapped(sender: UIBarButtonItem) {
        print("fenLeiBarButtonItemTapped")
        self.navigationController?.pushViewController(SFenLeiTableViewController(), animated: true)
    }
    
    func yuanXiBarButtonItemTapped(sender: UIBarButtonItem) {
        print("yuanXiBarButtonItemTapped")
        self.navigationController?.pushViewController(SYuanXiTableViewController(), animated: true)
    }
    
    func zhaoXinBarButtonItemTapped(sender: UIBarButtonItem) {
        print("zhaoXinBarButtonItemTapped")
        self.navigationController?.pushViewController(SZhaoXinTableViewController(), animated: true)
    }
    
}