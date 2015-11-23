//
//  NewHuoDongViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 11/3/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class NewHuoDongViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var scrollView: UIScrollView!
    var huoDongJianJieTextView: UITextView!
    var haiBaoImageView: UIImageView!
    var textsNeedToFill: [UIView] = []
    var finishButton: UIButton!
    
    var newImage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        view = scrollView
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.isReadyToEnableDoneButton()
        return true
    }
    
    // MARK: UITextViewDelegate
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        scrollView.contentOffset.y = 0
        self.isReadyToEnableDoneButton()
        return true
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        scrollView.contentOffset.y = 210
        
    }
    
    // MARK: UIImagePickerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.haiBaoImageView.image = selectedImage
        newImage = true
        self.isReadyToEnableDoneButton()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: UI
    
    func setupView() {
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.5)
        scrollView.backgroundColor = UIColor.whiteColor()
        
        // labels
        let mingChengLabel = UILabel(frame: CGRect(x: 20, y: 80, width: 70, height: 20))
        let shiJianLabel =  UILabel(frame: CGRect(x: 20, y: 120, width: 70, height: 20))
        let diDianLabel = UILabel(frame: CGRect(x: 20, y: 160, width: 70, height: 20))
        let renshuLabel = UILabel(frame: CGRect(x: 20, y: 200, width: 70, height: 20))
        let danWeiLabel = UILabel(frame: CGRect(x: 20, y: 240, width: 70, height: 20))
        let jianJieLabel = UILabel(frame: CGRect(x: 20, y: 280, width: 70, height: 20))
        let haiBaoLabel = UILabel(frame: CGRect(x: 20, y: 430, width: 70, height: 20))
        
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
        let mingChengTextField = UITextField(frame: CGRect(x: 120, y: 80, width: 150, height: 20))
        let shiJianTextField = UITextField(frame: CGRect(x: 120, y: 120, width: 150, height: 20))
        let diDianTextField = UITextField(frame: CGRect(x: 120, y: 160, width: 150, height: 20))
        let renShuTextField = UITextField(frame: CGRect(x: 120, y: 200, width: 150, height: 20))
        let danWeiTextField = UITextField(frame: CGRect(x: 120, y: 240, width: 150, height: 20))
        
        let placeholders = ["活动名称", "活动时间", "活动地点", "需要人数", "承办单位"]
        let textFields = [mingChengTextField, shiJianTextField, diDianTextField, renShuTextField, danWeiTextField]
        
        for textField in textFields {
            textField.delegate = self
            
            textField.returnKeyType = .Done
            textField.placeholder = "请输入" + placeholders[textFields.indexOf(textField)!]
            textField.textColor = UIColor.grayColor()
            textField.font = UIFont.systemFontOfSize(11)
            
            textField.layer.borderWidth = 0.5
            textField.layer.borderColor = UIColor.grayColor().CGColor
            textField.layer.cornerRadius = 3.0
            
            textField.textAlignment = .Center
            textsNeedToFill.append(textField)
            scrollView.addSubview(textField)
        }
        
        // jianJieTextField
        huoDongJianJieTextView = UITextView(frame: CGRect(x: 20, y: 310, width: 280, height: 100))
        huoDongJianJieTextView.delegate = self
        huoDongJianJieTextView.textColor = UIColor.grayColor()
        huoDongJianJieTextView.font = UIFont.systemFontOfSize(11)
        huoDongJianJieTextView.layer.borderColor = UIColor.grayColor().CGColor
        huoDongJianJieTextView.layer.borderWidth = 0.5
        huoDongJianJieTextView.layer.cornerRadius = 5.0
        textsNeedToFill.append(huoDongJianJieTextView)

        
        // 键盘上的工具栏
        let textViewToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
        let undoButton = UIBarButtonItem(title: "全清", style: .Plain, target: self, action: "undoButtonTapped:")
        let space = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "完成", style: .Done, target: self, action: "doneButtonTapped:")
        textViewToolBar.items  = [undoButton, space, doneButton]
        huoDongJianJieTextView.inputAccessoryView = textViewToolBar
        scrollView.addSubview(huoDongJianJieTextView)
        
        // haiBaoImageView
        haiBaoImageView = UIImageView(frame: CGRect(x: 20, y: 460, width: 150, height: 150))
        haiBaoImageView.image = UIImage(named: "noImage")
        haiBaoImageView.userInteractionEnabled = true
        // tapGestureRecoginizer
        let tapGestureRecoginizer = UITapGestureRecognizer(target: self, action: "selectImageFromPhotoLibrary:")
        tapGestureRecoginizer.locationInView(haiBaoImageView)
        haiBaoImageView.addGestureRecognizer(tapGestureRecoginizer)
        
        scrollView.addSubview(haiBaoImageView)
        
        // finishButton
        finishButton = UIButton(type: .System)
        finishButton.frame = CGRect(x: 100, y: 640, width: 100, height: 20)
        finishButton.setTitle("申请创建", forState: .Normal)
        finishButton.addTarget(self, action: "finishButtonTapped:", forControlEvents: .TouchDown)
        finishButton.enabled = false
        scrollView.addSubview(finishButton)
        
        self.view = scrollView
        
    }
    
    // MARK: Actions
    
    // jianJianTextView
    func undoButtonTapped(sender: UIBarButtonItem) {
        huoDongJianJieTextView.text = ""
    }
    
    func doneButtonTapped(sender: UIBarButtonItem) {
        huoDongJianJieTextView.resignFirstResponder()
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
        let alertView = UIAlertView(title: "提交成功", message: "等待审核", delegate: self, cancelButtonTitle: "OK")
        for view in textsNeedToFill {
            if let textField = view as? UITextField {
                textField.text = ""
            } else if let textView  = view as? UITextView {
                textView.text = ""
            }
        }
        haiBaoImageView.image = UIImage(named: "noImage")
        newImage = false
        finishButton.enabled = false
        scrollView.contentOffset.y = 0
        alertView.show()
        
    }
    
    func isReadyToEnableDoneButton() -> Bool {
        for view in textsNeedToFill {
            if let textField = view as? UITextField {
                if textField.text?.isEmpty == true {
                    
                    finishButton.enabled = false
                    return false
                }
            } else if let textView  = view as? UITextView {
                if textView.text.isEmpty == true {
                    finishButton.enabled = false
                    return false
                }
            }
        }
        if newImage == false {
            return false
        }
        finishButton.enabled = true
        return true
    }
}
