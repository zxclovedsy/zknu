//
//  XinDeViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 10/22/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class XinDeViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var segmentedControl: UISegmentedControl!
    var scrollView: UIScrollView!
    var anotherScrollView: UIScrollView!
    var huoDongJianJieTextView: UITextView!
    var sheTuanJianJieTextView: UITextView!
    var haiBaoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSegmentedControl()
        self.setupView()
        self.setupAnotherView()
        //for text
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
        switch segmentedControl.selectedSegmentIndex {
        case 0: scrollView.contentOffset.y = -50
        case 1: anotherScrollView.contentOffset.y = -40
        default:print("error")
        }
        return true
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        switch segmentedControl.selectedSegmentIndex {
        case 0: scrollView.contentOffset.y = 150
        case 1: anotherScrollView.contentOffset.y = 80
        default:print("error")
        }
    }
    
    // MARK: UIImagePickerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.haiBaoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
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
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.1)
        scrollView.backgroundColor = UIColor.whiteColor()
        
        // labels
        let mingChengLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 70, height: 20))
        let shiJianLabel =  UILabel(frame: CGRect(x: 20, y: 60, width: 70, height: 20))
        let diDianLabel = UILabel(frame: CGRect(x: 20, y: 100, width: 70, height: 20))
        let renshuLabel = UILabel(frame: CGRect(x: 20, y: 140, width: 70, height: 20))
        let danWeiLabel = UILabel(frame: CGRect(x: 20, y: 180, width: 70, height: 20))
        let jianJieLabel = UILabel(frame: CGRect(x: 20, y: 220, width: 70, height: 20))
        let haiBaoLabel = UILabel(frame: CGRect(x: 20, y: 370, width: 70, height: 20))
        
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
        haiBaoLabel.text = "活动海报"
        scrollView.addSubview(mingChengLabel)
        scrollView.addSubview(shiJianLabel)
        scrollView.addSubview(diDianLabel)
        scrollView.addSubview(renshuLabel)
        scrollView.addSubview(danWeiLabel)
        scrollView.addSubview(jianJieLabel)
        scrollView.addSubview(haiBaoLabel)
        
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
        huoDongJianJieTextView = UITextView(frame: CGRect(x: 20, y: 250, width: 280, height: 100))
        huoDongJianJieTextView.delegate = self
        huoDongJianJieTextView.textColor = UIColor.grayColor()
        
        // 键盘上的工具栏
        let textViewToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
        let undoButton = UIBarButtonItem(title: "全清", style: .Plain, target: self, action: "undoButtonTapped:")
        let space = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "完成", style: .Done, target: self, action: "doneButtonTapped:")
        textViewToolBar.items  = [undoButton, space, doneButton]
        huoDongJianJieTextView.inputAccessoryView = textViewToolBar
        scrollView.addSubview(huoDongJianJieTextView)
        
        // haiBaoImageView
        haiBaoImageView = UIImageView(frame: CGRect(x: 20, y: 400, width: 150, height: 150))
        haiBaoImageView.image = UIImage(named: "noImage")
        haiBaoImageView.userInteractionEnabled = true
        // tapGestureRecoginizer
        let tapGestureRecoginizer = UITapGestureRecognizer(target: self, action: "selectImageFromPhotoLibrary:")
        tapGestureRecoginizer.locationInView(haiBaoImageView)
        haiBaoImageView.addGestureRecognizer(tapGestureRecoginizer)
        
        scrollView.addSubview(haiBaoImageView)
        
        // finishButton
        let finishButton = UIButton(type: .System)
        finishButton.frame = CGRect(x: 100, y: 580, width: 100, height: 20)
        finishButton.setTitle("申请创建", forState: .Normal)
        finishButton.addTarget(self, action: "finishButtonTapped:", forControlEvents: .TouchDown)
        scrollView.addSubview(finishButton)
        
        self.view = scrollView
        
        // Actions
        
    }
    
    func setupAnotherView() {
        anotherScrollView = UIScrollView(frame: self.view.frame)
        anotherScrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.05)
        anotherScrollView.backgroundColor = UIColor.whiteColor()
        
        let mingChengLabel = UILabel(frame: CGRect(x: 20, y: 40, width: 70, height: 20))
        let leiXingLabel =  UILabel(frame: CGRect(x: 20, y: 80, width: 70, height: 20))
        let jiBieLabel = UILabel(frame: CGRect(x: 20, y: 120, width: 70, height: 20))
        let jianJieLabel = UILabel(frame: CGRect(x: 20, y: 160, width: 70, height: 20))
        
        mingChengLabel.text = "社团名称"
        leiXingLabel.text = "社团类型"
        jiBieLabel.text = "社团级别"
        jianJieLabel.text = "社团简介"
        
        anotherScrollView.addSubview(mingChengLabel)
        anotherScrollView.addSubview(leiXingLabel)
        anotherScrollView.addSubview(jiBieLabel)
        anotherScrollView.addSubview(jianJieLabel)
        
        // textView
        sheTuanJianJieTextView = UITextView(frame: CGRect(x: 20, y: 190, width: 280, height: 100))
        sheTuanJianJieTextView.delegate = self
        sheTuanJianJieTextView.textColor = UIColor.grayColor()
        
        // 键盘上的工具栏
        let textViewToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
        let undoButton = UIBarButtonItem(title: "全清", style: .Plain, target: self, action: "undoButtonTapped:")
        let space = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "完成", style: .Done, target: self, action: "doneButtonTapped:")
        textViewToolBar.items  = [undoButton, space, doneButton]
        sheTuanJianJieTextView.inputAccessoryView = textViewToolBar
        
        anotherScrollView.addSubview(sheTuanJianJieTextView)
        
    }
    
    // MARK: Actions
    
    func segmentedControlIndexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("选择创活动")
            view = scrollView
        case 1:
            print("选择创社团")
            view = anotherScrollView
            
        default:
            print("error")
        }
    }
    
    // jianJianTextView
    func undoButtonTapped(sender: UIBarButtonItem) {
        switch segmentedControl.selectedSegmentIndex {
        case 0: huoDongJianJieTextView.text = ""
        case 1: sheTuanJianJieTextView.text = ""
        default:print("error")
        }
        
    }
    
    func doneButtonTapped(sender: UIBarButtonItem) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:  huoDongJianJieTextView.resignFirstResponder()
        case 1:  sheTuanJianJieTextView.resignFirstResponder()
        default:print("error")
        }
    }
    
    // tapGestureRecognizer
    func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        huoDongJianJieTextView.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .PhotoLibrary
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func finishButtonTapped(sender: UIButton) {
        print("申请创建")
    }
}
