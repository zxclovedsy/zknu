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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBarHidden = true
        
        self.setupTopView()
        self.setupTableView()
        self.setupTouXiangImageView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    
    // MARK: UI
    
    func setupTopView() {
        topView = UIView(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: 80))
        topView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(topView)
    }
    
    func setupTableView() {
        let tableViewY: CGFloat = 100
        tableView = UITableView(frame: CGRect(x: 0, y: tableViewY, width: self.view.frame.width, height: self.view.frame.height))
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
    }
    
    func setupTouXiangImageView() {
        touXiangImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        touXiangImageView.image = UIImage(named: "noImage")
        touXiangImageView.layer.cornerRadius = touXiangImageView.frame.width / 2
        touXiangImageView.clipsToBounds = true
        self.navigationController?.navigationBar.addSubview(touXiangImageView)
    }

}
