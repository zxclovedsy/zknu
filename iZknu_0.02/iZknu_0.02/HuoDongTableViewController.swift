//
//  HuoDongTableViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 10/22/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class HuoDongTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DOPDropDownMenuDataSource, DOPDropDownMenuDelegate {
    
    var activityList = [Int: ccOrgActivity]()
    
    var scrollView: UIScrollView!
    var menu: DOPDropDownMenu!
    var carouselView: UICarouselView!
    var tableView: UITableView!
    
    let departments = ["所有院系", "网络工程学院", "计算机科学与技术学院", "文学院", "政法学院", "外国语学院", "数学与统计学院", "物理与电信工程学院", "化学化工学院", "生命科学与农学学院", "教育科学学院", "美术学院", "音乐舞蹈学院", "体育学院", "经济与管理学院", "新闻与传媒学院", "机械与电气工程学院", "设计学院", "软件学院", "继续教育学院", "马克思主义学院", "公共艺术与职业技能教研部"]
    let types = ["所有类型", "电影", "晚会", "征稿", "派对", "比赛", "展览", "演讲", "讲座", "交流", "公益", "宣传", "环保", "其它"]
    let times = ["所有时间", "最近几天", "最近几周", "最近几月"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "周口师范学院"
        self.navigationController?.title = "活动"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: self, action: "")
        
        self.setupActivityList()
        
        self.setupScrollView()
        self.setupMenu()
        self.setupCarouselView()
        self.setupTableView()
        self.setupContentSize()
    }
    
    

    

    // MARK: - UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityList.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "HuoDongTableCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? HuoDongTableViewCell
        if cell == nil {
            cell = HuoDongTableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        cell?.activity = activityList[indexPath.row]
        cell?.contentView.userInteractionEnabled = false
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.navigationController?.pushViewController(HuoDongViewController(), animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let firstOffset:CGFloat = -64
        let menuHeight:CGFloat = 40
        let sumOffset = self.carouselView.frame.height + self.carouselView.frame.origin.y + firstOffset - menuHeight
        if self.scrollView.scrollEnabled == true {
            tableView.scrollEnabled = false
        } else {
            tableView.scrollEnabled = true
        }
        
        assert(self.scrollView.scrollEnabled != tableView.scrollEnabled, "cannot have the same Enabled")
        
        if tableView.contentOffset.y < 0 {
            tableView.scrollEnabled = false
            self.scrollView.scrollEnabled = true
        }
        
        if self.scrollView.contentOffset.y > sumOffset {
            self.scrollView.contentOffset.y = sumOffset
            tableView.scrollEnabled = true
            self.scrollView.scrollEnabled = false
        }
        if self.scrollView.contentOffset.y == 72 {
            self.scrollView.contentOffset.y = 136
        }
    }
    
    // MARK: - MenuDataSource
    
    func numberOfColumnsInMenu(menu: DOPDropDownMenu!) -> Int {
        return 3
    }
    
    func menu(menu: DOPDropDownMenu!, numberOfRowsInColumn column: Int) -> Int {
        switch column {
        case 0: return departments.count
        case 1: return types.count
        case 2: return times.count
        default:
            assertionFailure("ERROR in number of rows in column")
            return 0
        }
    }
    
    func menu(menu: DOPDropDownMenu!, titleForRowAtIndexPath indexPath: DOPIndexPath!) -> String! {
        switch indexPath.column {
        case 0: return departments[indexPath.row]
        case 1: return types[indexPath.row]
        case 2: return times[indexPath.row]
        default:
            assertionFailure("ERROR in title for row at indexPath")
            return ""
        }
    }
    
    func menu(menu: DOPDropDownMenu!, didSelectRowAtIndexPath indexPath: DOPIndexPath!) {
        switch indexPath.column {
        case 0: print("Selected 院系 \(departments[indexPath.row])")
        case 1: print("Selected 类型 \(types[indexPath.row])")
        case 2: print("Selected 时间 \(times[indexPath.row])")
        default: assertionFailure("ERROR in did seletct menu ")
        }
    }
    
    // MARK: Data
    
    func setupActivityList() {
        let dtMgr = ccOrgIF.sharedInstance.getDataManager() as! ccOrgDataManager
        self.activityList = dtMgr.configDataActivity.activityList
    }

    // MARK: UI
    
    func setupScrollView() {
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        //self.view = scrollView
        self.view.addSubview(scrollView)
    }
    
    func setupMenu() {
        let navBarHeight = (self.navigationController?.navigationBar.frame.height)!
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let menuHeight: CGFloat = 40
        menu = DOPDropDownMenu(origin: CGPoint(x: 0, y: navBarHeight + statusBarHeight), andHeight: menuHeight)
        menu.delegate = self
        menu.dataSource = self
        self.view.addSubview(menu)
    }
    
    func setupCarouselView() {
        var images: [UIImage] = []
        for i in 1...4 {
            let image = UIImage(named: "daohang\(i)")
            images.append(image!)
        }
        carouselView = UICarouselView(images: images, origin: CGPoint(x: 0, y: 40), height: 200)
        self.scrollView.addSubview(carouselView)
    }
    
    func setupTableView() {
        let tabBarHeight = (self.tabBarController?.tabBar.frame.height)!
        let navBarHeight = (self.navigationController?.navigationBar.frame.height)!
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let menuHeight = menu.frame.height
        tableView = UITableView(frame: CGRect(x: 0, y: self.carouselView.frame.origin.y + self.carouselView.frame.height, width: self.view.frame.width, height: self.view.frame.height - tabBarHeight - navBarHeight - statusBarHeight - menuHeight))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.scrollEnabled = false
        tableView.rowHeight = 110
        self.scrollView.addSubview(tableView)
    }
    
    func setupContentSize() {
        let height = tableView.frame.origin.y
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: height + self.view.frame.height)
    }
    
    // MARK: Actions

    

}
