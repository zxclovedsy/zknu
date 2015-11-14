//
//  SheTuanTableViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 10/22/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class SheTuanTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DOPDropDownMenuDataSource, DOPDropDownMenuDelegate {
    
    var tableView: UITableView!
    var menu: DOPDropDownMenu!
    
    let departments = ["所有院系", "网络工程学院", "计算机科学与技术学院", "文学院", "政法学院", "外国语学院", "数学与统计学院", "物理与电信工程学院", "化学化工学院", "生命科学与农学学院", "教育科学学院", "美术学院", "音乐舞蹈学院", "体育学院", "经济与管理学院", "新闻与传媒学院", "机械与电气工程学院", "设计学院", "软件学院", "继续教育学院", "马克思主义学院", "公共艺术与职业技能教研部"]
    let types = ["所有类型", "学术", "艺术", "公益", "爱好", "社会实践", "官方组织", "其它"]
    let recruitments = ["所有社团","招新", "已招满"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "社团"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: self, action: "")
        
        self.setupMenu()
        self.setupTableView()
        
    }
    
    // MARK: - menuDataSource
    func numberOfColumnsInMenu(menu: DOPDropDownMenu!) -> Int {
        return 3
    }
    
    func menu(menu: DOPDropDownMenu!, numberOfRowsInColumn column: Int) -> Int {
        switch column {
        case 0: return departments.count
        case 1: return types.count
        case 2: return recruitments.count
        default:
            assertionFailure("ERROR in number of rows in column")
            return 0
        }
    }
    
    func menu(menu: DOPDropDownMenu!, titleForRowAtIndexPath indexPath: DOPIndexPath!) -> String! {
        let row = indexPath.row
        switch indexPath.column {
        case 0: return departments[row]
        case 1: return types[row]
        case 2: return recruitments[row]
        default:
            assertionFailure("ERROR in title for row at indexpath")
            return ""
        }
    }
    
    func menu(menu: DOPDropDownMenu!, didSelectRowAtIndexPath indexPath: DOPIndexPath!) {
        switch indexPath.column {
        case 0: print("Selected 院系 \(departments[indexPath.row])")
        case 1: print("Selected 类型 \(types[indexPath.row])")
        case 2: print("Selected 人员状况 \(recruitments[indexPath.row])")
        default: assertionFailure("ERROR in did seletct menu ")
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "testCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cellIdentifier")
            cell?.textLabel!.text = "\(indexPath.row)"
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.navigationController?.pushViewController(SheTuanViewController(), animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - UI
    
    func setupMenu() {
        let navBarHeight = (self.navigationController?.navigationBar.frame.height)!
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        menu = DOPDropDownMenu(origin: CGPoint(x: 0, y: navBarHeight + statusBarHeight), andHeight: 40)
        menu.dataSource = self
        menu.delegate = self
        self.view.addSubview(menu)
    }
    
    func setupTableView() {
        let menuHeight = self.menu.frame.height
        let tabBarHeight = (self.tabBarController?.tabBar.frame.height)!
        let navBarHeight = (self.navigationController?.navigationBar.frame.height)!
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let tableViewY = menu.frame.origin.y + menu.frame.height
        self.tableView = UITableView(frame: CGRect(x: 0, y: tableViewY, width: self.view.frame.width, height: self.view.frame.height - menuHeight - tabBarHeight - navBarHeight - statusBarHeight))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(tableView)
    }
    
    
    
    // MARK: - Actions
    
}