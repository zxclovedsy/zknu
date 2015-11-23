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
    var newHuoDongViewController: NewHuoDongViewController!
    var newSheTuanViewController: NewSheTuanViewController!
    var loadingView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSegmentedControl()
        self.setupLoadingView()
        newSheTuanViewController = NewSheTuanViewController()
        newHuoDongViewController = NewHuoDongViewController()
        self.view.addSubview(newHuoDongViewController.view)
    }
    
    override func viewDidAppear(animated: Bool) {
        //self.loadingView.stopAnimating()
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
    
    func setupLoadingView() {
        let tab = self.tabBarController as! tabBarViewController
        self.loadingView = tab.loadingView
    }
   
    // MARK: Actions
    
    func segmentedControlIndexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.subviews[0].removeFromSuperview()
            self.view.addSubview(newHuoDongViewController.view)
        case 1:
            self.view.subviews[0].removeFromSuperview()
            self.view.addSubview(newSheTuanViewController.view)
        default:
            print("error")
        }
    }
    
  
}
