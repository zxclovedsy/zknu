//
//  XinDeViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 10/22/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class XinDeViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
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
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: UITextViewDelegate
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        print("press")
        textView.resignFirstResponder()
        return true
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
        let scrollView = UIScrollView(frame: self.view.frame)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.3)
        scrollView.backgroundColor = UIColor.whiteColor()
        
        // labels
        let mingChengLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 70, height: 20))
        let shiJianLabel =  UILabel(frame: CGRect(x: 20, y: 60, width: 70, height: 20))
        let diDianLabel = UILabel(frame: CGRect(x: 20, y: 100, width: 70, height: 20))
        let renshuLabel = UILabel(frame: CGRect(x: 20, y: 140, width: 70, height: 20))
        let danWeiLabel = UILabel(frame: CGRect(x: 20, y: 180, width: 70, height: 20))
        let jianJieLabel = UILabel(frame: CGRect(x: 20, y: 220, width: 70, height: 20))
        mingChengLabel.text = "活动名称"
        shiJianLabel.text = "活动时间"
        diDianLabel.text = "活动地点"
        renshuLabel.text = "需要人数"
        danWeiLabel.text = "承办单位"
        jianJieLabel.text = "活动简介"
        shiJianLabel.text = "活动时间"
        diDianLabel.text = "活动地点"
        renshuLabel.text = "需要人数"
        danWeiLabel.text = "承办单位"
        jianJieLabel.text = "活动简介"
        scrollView.addSubview(mingChengLabel)
        scrollView.addSubview(shiJianLabel)
        scrollView.addSubview(diDianLabel)
        scrollView.addSubview(renshuLabel)
        scrollView.addSubview(danWeiLabel)
        scrollView.addSubview(jianJieLabel)
        
        //textFields
        let mingChengTextField = UITextField(frame: CGRect(x: 120, y: 20, width: 150, height: 20))
        let shiJianTextField = UITextField(frame: CGRect(x: 120, y: 60, width: 150, height: 20))
        let diDianTextField = UITextField(frame: CGRect(x: 120, y: 100, width: 150, height: 20))
        let renShuTextField = UITextField(frame: CGRect(x: 120, y: 140, width: 150, height: 20))
        let danWeiTextField = UITextField(frame: CGRect(x: 120, y: 180, width: 150, height: 20))
        
        mingChengTextField.placeholder = "活动名称"
        shiJianTextField.placeholder = "活动时间"
        diDianTextField.placeholder = "活动地点"
        renShuTextField.placeholder = "需要人数"
        danWeiTextField.placeholder = "承办单位"
        
        mingChengTextField.delegate = self
        shiJianTextField.delegate = self
        diDianTextField.delegate = self
        renShuTextField.delegate = self
        danWeiTextField.delegate = self
        
        mingChengTextField.returnKeyType = .Done
        shiJianTextField.returnKeyType = .Done
        diDianTextField.returnKeyType = .Done
        renShuTextField.returnKeyType = .Done
        danWeiTextField.returnKeyType = .Done
        
        mingChengTextField.textColor = UIColor.grayColor()
        shiJianTextField.textColor = UIColor.grayColor()
        diDianTextField.textColor = UIColor.grayColor()
        renShuTextField.textColor = UIColor.grayColor()
        danWeiTextField.textColor = UIColor.grayColor()

        scrollView.addSubview(mingChengTextField)
        scrollView.addSubview(shiJianTextField)
        scrollView.addSubview(diDianTextField)
        scrollView.addSubview(renShuTextField)
        scrollView.addSubview(danWeiTextField)
        
        // jianJieTextField
        let jianJieTextView = UITextView(frame: CGRect(x: 20, y: 250, width: 280, height: 100))
        jianJieTextView.delegate = self
        scrollView.addSubview(jianJieTextView)
        
        // haiBaoImage
        
        
        self.view = scrollView
    }
    
    func setupAnotherView() {
        anotherView = UIView(frame: self.view.frame)
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
