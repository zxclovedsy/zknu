//
//  SheTuanViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 10/24/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class SheTuanViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{

    var scrollView : UIScrollView!
    var imageView: UIImageView!
    var textFields: [UITextField]!
    var photosScrollView: UIScrollView!
    var origin: CGPoint!
    var leftButton: UIButton!
    var rightButton: UIButton!
    var leftButtonEnabled = true
    var rightButtonEnabled = true
    
    var organization: ccOrganization!
    
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
        self.setupPhotosScrollView()
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
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 1.2)
        scrollView.backgroundColor = UIColor.whiteColor()
        view = scrollView
    }
    
    func setupImageView() {
        imageView = UIImageView(frame: CGRect(x: 0, y: origin.y, width: self.view.frame.width, height: 200))
        let imageUrl = organization.headImageUrl
        if let image = UIImage(named: imageUrl) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "noImage")
        }
        
        self.view.addSubview(imageView)
    }
    
    func setupLabels() {
        let texts = ["社团名称", "社团规模", "社团人数", "相册区", "社团简介"]
        let originY = origin.y + imageView.frame.height + 20
        for (index, text) in texts.enumerate() {
            let label = UILabel(frame: CGRect(x: 20, y: originY + CGFloat(index) * CGFloat(40), width: 70, height: 20))
            label.text = text
            if index == 4 {
                label.frame.origin.y += 70
            }
            self.view.addSubview(label)
        }
        
    }
    
    func setupTextFields() {
        let texts = [organization.name, "\(organization.scale)人社团", "\(organization.numberOfPeople)"]
        let originY = origin.y + imageView.frame.height + 20
        for (index, text) in texts.enumerate() {
            let textField = UITextField(frame: CGRect(x: 120, y: CGFloat(40 * index) + originY, width: 150, height: 20))
            textField.delegate = self
            textField.text = text
            textField.textColor = UIColor.grayColor()
            textField.font = UIFont.systemFontOfSize(11)
            textField.layer.borderWidth = 0
            textField.layer.borderColor = UIColor.grayColor().CGColor
            textField.layer.cornerRadius = 3.0
            textField.textAlignment = .Center
            self.view.addSubview(textField)
        }
    }
    
    func setupTextView() {
        let text = organization.summary
        let originY: CGFloat = 360.0 + 30 + 30
        let textView = UITextView(frame: CGRect(x: 20, y: originY, width: 280, height: 100))
        textView.delegate = self
        textView.text = text
        textView.textColor = UIColor.grayColor()
        textView.font = UIFont.systemFontOfSize(11)
        textView.layer.borderColor = UIColor.grayColor().CGColor
        textView.layer.borderWidth = 0
        textView.layer.cornerRadius = 5.0
        self.view.addSubview(textView)
    }
    
    func setupPhotosScrollView() {
        photosScrollView = UIScrollView(frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: 80))
        var images: [UIImage] = []
        let noImage = UIImage(named: "noImage")!
        for nameUrl in organization.photosUrl {
            if let image = UIImage(named: nameUrl) {
                images.append(image)
            }else {
                images.append(noImage)
            }
            
        }
        let width: CGFloat = 140
        let height = photosScrollView.frame.height
        photosScrollView.contentSize = CGSize(width: width * CGFloat(images.count), height: height)
        for (index, image) in images.enumerate() {
            let x = CGFloat(index) * width
            let imageView = UIImageView(frame: CGRect(x: x, y: 0, width: width, height: height))
            imageView.image = image
            photosScrollView.addSubview(imageView)
        }
        self.view.addSubview(photosScrollView)
    }
    
    func setupButton() {
        let y: CGFloat = 390 + 100 + 20 + 30
        leftButton = UIButton(type: .System)
        leftButton.frame = CGRect(x: (self.view.frame.width / 2 - 100) / 2, y: y, width: 100, height: 20)
        if leftButtonEnabled {
            leftButton.setTitle("我要关注", forState: .Normal)
        } else {
            leftButton.setTitle("已关注", forState: .Normal)
            leftButton.enabled = false
        }
        leftButton.addTarget(self, action: "woYaoGuanZhuButtonTapped:", forControlEvents: .TouchDown)
        rightButton = UIButton(type: .System)
        rightButton.frame = CGRect(x: self.view.frame.width / 2 + leftButton.frame.origin.x, y: y, width: 100, height: 20)
        if rightButtonEnabled {
            rightButton.setTitle("申请加入", forState: .Normal)
        } else {
            rightButton.setTitle("已加入", forState: .Normal)
            rightButton.enabled = false
        }
        rightButton.addTarget(self, action: "shenQingJiaRuButtonTapped:", forControlEvents: .TouchDown)
        
        self.view.addSubview(leftButton)
        self.view.addSubview(rightButton)
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
    
    func woYaoGuanZhuButtonTapped(sender: UIButton) {
        let alertView = UIAlertView(title: "关注成功", message: "", delegate: self, cancelButtonTitle: "OK")
        alertView.show()
    }
    
    func shenQingJiaRuButtonTapped(sender: UIButton) {
        let shenQingJiaRuViewController = ShenQingJiaRuViewController()
        let navigationController = UINavigationController(rootViewController: shenQingJiaRuViewController)
        self.navigationController?.presentViewController(navigationController, animated: true, completion: nil)
        
    }

}
