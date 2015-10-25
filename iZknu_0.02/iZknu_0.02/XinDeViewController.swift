//
//  XinDeViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 10/22/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class XinDeViewController: UIViewController {
    
    var segmentedControl: UISegmentedControl!
    var anotherView: UIView!
    var tempView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSegmentedControl()
        self.setupView()
        self.setupAnotherView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UI
    
    func setupSegmentedControl() {
        segmentedControl = UISegmentedControl(items: nil)
        segmentedControl.insertSegmentWithTitle("创活动", atIndex: 0, animated: true)
        segmentedControl.insertSegmentWithTitle("创社团", atIndex: 1, animated: true)
        
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.frame.origin.x = self.view.frame.width / 2 - segmentedControl.frame.width / 2
        if let height = self.navigationController?.navigationBar.frame.height {
            segmentedControl.frame.origin.y = height - segmentedControl.frame.height
        }
        
        segmentedControl.addTarget(self, action: "segmentedControlIndexChanged:", forControlEvents: .ValueChanged)
        
        self.navigationController?.navigationBar.addSubview(segmentedControl)
    }
    
    func setupView() {
        view.backgroundColor = UIColor.whiteColor()
        let label = UILabel(frame: CGRect(x: 120, y: 100, width: 100, height: 100))
        label.text = "创活动"
        view.addSubview(label)
    }
    
    func setupAnotherView() {
        anotherView = UIView(frame: self.view.frame)
        anotherView.backgroundColor = UIColor.redColor()
        let label = UILabel(frame: CGRect(x: 120, y: 100, width: 100, height: 100))
        label.text = "创社团"
        
        anotherView.addSubview(label)
    }
    
    // MARK: Actions
    
    func segmentedControlIndexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("选择创活动")
            view = tempView!
        case 1:
            print("选择创社团")
            tempView = view
            view = anotherView
            
        default:
            print("error")
        }
    }
}
