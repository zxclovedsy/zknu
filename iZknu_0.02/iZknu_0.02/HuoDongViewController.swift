//
//  HuoDongViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 10/23/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class HuoDongViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var scrollView : UIScrollView!
    var imageView: UIImageView!
    var textFields: [UITextField]!
    var origin: CGPoint!
    
    override func viewWillAppear(animated: Bool) {
        let clearImage = getImageWithColor(UIColor.clearColor(), size: (self.navigationController?.navigationBar.frame.size)!)
        let navBar = (self.navigationController?.navigationBar)!
        
        navBar.setBackgroundImage(clearImage, forBarMetrics: .Compact)
        navBar.clipsToBounds = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        let navBar = (self.navigationController?.navigationBar)!
        navBar.setBackgroundImage(nil, forBarMetrics: .Compact)
        navBar.clipsToBounds = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        origin = CGPoint(x: 0, y: view.frame.origin.y - (self.navigationController?.navigationBar.frame.height)! - UIApplication.sharedApplication().statusBarFrame.height)
        
        self.setupScrollView()
        self.setupImageView()
        self.setupLabels()
        self.setupTextFields()
        self.setupTextView()
        self.setupButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UI
    
    func setupScrollView() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 1.1)
        scrollView.backgroundColor = UIColor.whiteColor()
        view = scrollView
    }
    
    func setupImageView() {
        imageView = UIImageView(frame: CGRect(x: 0, y: origin.y, width: self.view.frame.width, height: 200))
        imageView.image = UIImage(named: "noImage")
        self.view.addSubview(imageView)
    }
    
    func setupLabels() {
        let texts = ["活动名称", "活动时间", "活动地点", "活动级别", "报名人数", "活动简介"]
        let originY = origin.y + imageView.frame.height + 20
        for (index, text) in texts.enumerate() {
            let label = UILabel(frame: CGRect(x: 20, y: originY + CGFloat(index) * CGFloat(40), width: 70, height: 20))
            label.text = text
            self.view.addSubview(label)
        }
        
    }
    
    func setupTextFields() {
        let texts = ["活动名称", "活动时间", "活动地点", "院级／校级", "0／12"]
        let originY = origin.y + imageView.frame.height + 20
        for (index, text) in texts.enumerate() {
            let textField = UITextField(frame: CGRect(x: 120, y: CGFloat(40 * index) + originY, width: 150, height: 20))
            textField.delegate = self
            textField.text = text
            textField.textColor = UIColor.grayColor()
            textField.font = UIFont.systemFontOfSize(11)
            textField.layer.borderWidth = 0.5
            textField.layer.borderColor = UIColor.grayColor().CGColor
            textField.layer.cornerRadius = 3.0
            textField.textAlignment = .Center
            self.view.addSubview(textField)
        }
    }
    
    func setupTextView() {
        let text = "这里是活动的具体简介……"
        let originY: CGFloat = 360.0 + 30
        let textView = UITextView(frame: CGRect(x: 20, y: originY, width: 280, height: 100))
        textView.delegate = self
        textView.text = text
        textView.textColor = UIColor.grayColor()
        textView.font = UIFont.systemFontOfSize(11)
        textView.layer.borderColor = UIColor.grayColor().CGColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 5.0
        self.view.addSubview(textView)
    }
    
    func setupButton() {
        let y: CGFloat = 390 + 100 + 20
        let button = UIButton(type: .System)
        button.frame = CGRect(x: (self.view.frame.width - 100) / 2, y: y, width: 100, height: 20)
        button.setTitle("立即报名", forState: .Normal)
        button.addTarget(self, action: "buttonTapped:", forControlEvents: .TouchDown)
        self.view.addSubview(button)
    }
    
    // MARK: - UIScrollViewDelegate
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return false
    }
    
    // MARK: - UITextViewDelegate
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        return  false
    }
    
    // MARK: - Actions
    
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func buttonTapped(sender: UIButton) {
        
    }

}
