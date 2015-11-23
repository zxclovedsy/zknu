//
//  SheTuanTableViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 10/22/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class SheTuanTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DOPDropDownMenuDataSource, DOPDropDownMenuDelegate {
    
    var organizationList: [Int: ccOrganization]!
    var ids = [Int]()
    var originalOrganizationList: [Int: ccOrganization]!
    var originalIds = [Int]()
    
    var scrollView: UIScrollView!
    var tableView: UITableView!
    var loadingView: UIActivityIndicatorView!
    var menu: DOPDropDownMenu!
    
    let colleges = ["所有院系", "网络工程学院", "计算机科学与技术学院", "文学院", "政法学院", "外国语学院", "数学与统计学院", "物理与电信工程学院", "化学化工学院", "生命科学与农学学院", "教育科学学院", "美术学院", "音乐舞蹈学院", "体育学院", "经济与管理学院", "新闻与传媒学院", "机械与电气工程学院", "设计学院", "软件学院", "继续教育学院", "马克思主义学院", "公共艺术与职业技能教研部"]
    let types = ["所有类型", "学术", "艺术", "公益", "爱好", "社会实践", "官方组织", "其它"]
    let recruitments = ["所有社团","招新", "已招满"]
    
    var college = "所有院系"
    var type = "所有类型"
    var recruitment = "所有社团"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "社团"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: self, action: "")

        self.setupOrganizationList()
        self.setupScrollView()
        self.setupMenu()
        self.setupTableView()
        self.setupLoadingView()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.loadingView.stopAnimating()
    }
    
    // MARK: - menuDataSource
    func numberOfColumnsInMenu(menu: DOPDropDownMenu!) -> Int {
        return 3
    }
    
    func menu(menu: DOPDropDownMenu!, numberOfRowsInColumn column: Int) -> Int {
        switch column {
        case 0: return colleges.count
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
        case 0: return colleges[row]
        case 1: return types[row]
        case 2: return recruitments[row]
        default:
            assertionFailure("ERROR in title for row at indexpath")
            return ""
        }
    }
    
    func menu(menu: DOPDropDownMenu!, didSelectRowAtIndexPath indexPath: DOPIndexPath!) {
        //筛选
        switch indexPath.column {
        case 0: college = colleges[indexPath.row]
        case 1: type = types[indexPath.row]
        case 2: recruitment = recruitments[indexPath.row]
        default: assertionFailure("ERROR in did seletct menu ")
        }
        var dic = originalOrganizationList
        for (key, value) in dic {
            if (college != colleges[0] && value.college != college) || (type != types[0] && value.type != type) || (recruitment != recruitments[0] && value.recruitment != recruitment) {
                dic.removeValueForKey(key)
            }
        }
        organizationList = dic
        ids = Array(dic.keys)
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizationList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = SheTuanTableViewCell()
        let id = ids[indexPath.row]
        cell.organization = organizationList[id]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let id = ids[indexPath.row]
        let organization = organizationList[id]
        let viewController = SheTuanViewController()
        viewController.organization  = organization
        self.navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: Data
    
    func setupOrganizationList() {
        let dataManager = ccOrgIF.sharedInstance.getDataManager() as! ccOrgDataManager
        organizationList = dataManager.configDataOrganization.organizationList
        ids = Array(organizationList.keys)
        
        originalOrganizationList = organizationList
        originalIds = ids
    }
    
    // MARK: - UI
    
    func setupScrollView() {
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.showsVerticalScrollIndicator = false
        view = scrollView
    }
    
    func setupMenu() {
        //let navBarHeight = (self.navigationController?.navigationBar.frame.height)!
        //let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        menu = DOPDropDownMenu(origin: CGPoint(x: 0, y: 0), andHeight: 40)
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
        self.tableView.rowHeight = 110
        self.view.addSubview(tableView)
    }
    
    func setupLoadingView() {
        let tab = self.tabBarController as! tabBarViewController
        self.loadingView = tab.loadingView
    }
    
    
    
    
    
    
    // MARK: - Actions
    
}