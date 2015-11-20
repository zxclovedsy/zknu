//
//  WoDeTableViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 10/22/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class WoDeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var touXiangImageView: UIImageView!
    var topView: UIView!
    var nameLabel: UILabel!
    var numberLabel: UILabel!
    
    let info = ["创建的社团", "加入的社团", "创建的活动", "参加的活动", "我的关注"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: self, action: "")
        self.setupTopView()
        self.setupTableView()
        self.setupTouXiangImageView()
        self.setupLabels()
        /*let dtMgr : ccOrgDataManager = ccOrgIF.sharedInstance.getDataManager() as! ccOrgDataManager
        print(dtMgr.getMember(101)?.name)*/
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return info.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "identifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel?.text = info[indexPath.row]
        cell?.imageView?.image = UIImage(named: "noImage")
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var pushViewController: UIViewController?
        switch indexPath.row {
        case 0: pushViewController = ChuangJianDeSheTuanTableViewController() // 创建的社团
        case 1: pushViewController = JiaRuDeSheTuanTableViewController()    // 加入的社团
        case 2: pushViewController = ChuangJianDeHuoDongTableViewController()   // 创建的活动
        case 3: pushViewController = CanJiaDeHuoDongTableViewController()   // 参加的活动
        case 4: pushViewController = WoDeGuanZhuTableViewController()   // 我的关注
        default:print("error")
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.navigationController?.pushViewController(pushViewController!, animated: true)
    }
    
    // MARK: UI
    
    func setupTopView() {
        topView = UIView(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: 80))
        self.view.addSubview(topView)
    }
    
    func setupTableView() {
        let y: CGFloat = 100
        let tabBarHeight = (self.tabBarController?.tabBar.frame.height)!
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        tableView = UITableView(frame: CGRect(x: 0, y: y, width: self.view.frame.width, height: self.view.frame.height - tabBarHeight - topView.frame.height - statusBarHeight))
        //tableView.rowHeight = 60
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
    }
    
    func setupTouXiangImageView() {
        touXiangImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 60, height: 60))
        touXiangImageView.image = UIImage(named: "noImage")
        touXiangImageView.layer.cornerRadius = touXiangImageView.frame.width / 2
        touXiangImageView.clipsToBounds = true
        self.topView.addSubview(touXiangImageView)
    }
    
    func setupLabels() {
        nameLabel = UILabel(frame: CGRect(x: 90, y: 60, width: 90, height: 15))
        nameLabel.font = UIFont.systemFontOfSize(12)
        nameLabel.text = "姓名 "
        self.topView.addSubview(nameLabel)
        
        numberLabel = UILabel(frame: CGRect(x: 180, y: 60, width: 120, height: 15))
        numberLabel.font = UIFont.systemFontOfSize(12)
        numberLabel.text = "学号 "
        self.topView.addSubview(numberLabel)
    }
    
    //MARK: Actions

}
