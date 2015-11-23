//
//  ShenQingJiaRuViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 11/15/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit
class ShenQingJiaRuViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextViewDelegate, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    var tapGestureRecoginizer: UITapGestureRecognizer!
    var textsNeedToFill: [UIView] = []
    var textView: UITextView!
    
    var newImage = false
    let colleges = ["网络工程学院", "计算机科学与技术学院", "文学院", "政法学院", "外国语学院", "数学与统计学院", "物理与电信工程学院", "化学化工学院", "生命科学与农学学院", "教育科学学院", "美术学院", "音乐舞蹈学院", "体育学院", "经济与管理学院", "新闻与传媒学院", "机械与电气工程学院", "设计学院", "软件学院", "继续教育学院", "马克思主义学院", "公共艺术与职业技能教研部"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "申请加入"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "cancelBarButtonTapped:")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "doneBarButtonTapped:")
        self.navigationItem.rightBarButtonItem?.enabled = false
        
        self.setupScrollView()
        self.setupLabels()
        self.setupPickerView()
        self.setupTextFields()
        self.setupTextView()
        self.setupImageView()
    
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TextFielddelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        isReadyToEnableDoneButton()
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        self.navigationItem.rightBarButtonItem?.enabled = false
        return true
    }
    
    // MARK: - PickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colleges.count
    }
    
    // MARK: - PickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colleges[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("selected")
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, var reusingView view: UIView?) -> UIView {
        if view == nil {
            view = UILabel() as UIView
        }
        if var label = view as? UILabel {
            label = UILabel()
            label.minimumScaleFactor = 12
            label.adjustsFontSizeToFitWidth = true
            label.textColor = UIColor.blackColor()
            label.font = UIFont.systemFontOfSize(12)
            label.textAlignment = .Center
            label.text = self.pickerView(pickerView, titleForRow: row, forComponent: component)
            return label
        }
        return view!
    }
    
    // MARK: - UITextViewDelegate 
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        scrollView.contentOffset.y = 155
        self.navigationItem.rightBarButtonItem?.enabled = false
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        scrollView.contentOffset.y = 227
        self.isReadyToEnableDoneButton()
    }

    
    // MARK: imagePickControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = selectedImage
        newImage = true
        self.isReadyToEnableDoneButton()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
    
    // MARK: UI
    
    func setupScrollView() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        scrollView.delegate = self
        //scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 1.4)
        scrollView.backgroundColor = UIColor.whiteColor()
        view = scrollView
    }
    
    func setupLabels() {
        let texts = ["姓名", "性别", "年级", "学院", "申请职位", "申请理由", "上传照片"]
        let originY = CGFloat(20)
        for (index, text) in texts.enumerate() {
            let label = UILabel(frame: CGRect(x: 20, y: originY + CGFloat(index) * CGFloat(40), width: 70, height: 20))
            if index == 6 {
                label.frame.origin.y += 100
            }
            if index == 3 {
                label.frame.origin.y += 40
            }
            if index > 3 {
                label.frame.origin.y += 80
            }
            label.text = text
            self.view.addSubview(label)
        }
    }
    
    func setupTextFields() {
        let texts = ["姓名", "男／女", "2015/2014/2013/2012", "", "成员／干事"]
        let originY = CGFloat(20)
        for (index, text) in texts.enumerate() {
            if index == 3 {
                continue
            }
            let textField = UITextField(frame: CGRect(x: 120, y: CGFloat(40 * index) + originY, width: 150, height: 20))
            if index == 4 {
                textField.frame.origin.y += 80
            }
            textField.delegate = self
            textField.tag = index
            textField.placeholder = text
            textField.returnKeyType = .Done
            textField.textColor = UIColor.grayColor()
            textField.font = UIFont.systemFontOfSize(11)
            textField.layer.borderWidth = 0.5
            textField.layer.borderColor = UIColor.grayColor().CGColor
            textField.layer.cornerRadius = 3.0
            textField.textAlignment = .Center
            textsNeedToFill.append(textField)
            self.view.addSubview(textField)
        }
    }
    
    func setupPickerView() {
        let pickerView = UIPickerView(frame: CGRect(x: 120, y: 110, width: 150, height: 162))
        pickerView.dataSource = self
        pickerView.delegate = self
        self.view.addSubview(pickerView)
        print(pickerView.frame)
    }
    
    func setupTextView() {
        textView = UITextView(frame: CGRect(x: 20, y: 250 + 80, width: 280, height: 100))
        textView.delegate = self
        textView.textColor = UIColor.grayColor()
        textView.layer.borderColor = UIColor.grayColor().CGColor
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 0.5
        textView.font = UIFont.systemFontOfSize(11)
        
        // 键盘上的工具栏
        let textViewToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
        let undoButton = UIBarButtonItem(title: "全清", style: .Plain, target: self, action: "undoButtonTapped:")
        let space = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "完成", style: .Done, target: self, action: "doneButtonTapped:")
        textViewToolBar.items  = [undoButton, space, doneButton]
        textView.inputAccessoryView = textViewToolBar
        
        textsNeedToFill.append(textView)
        self.view.addSubview(textView)
        
        
    }
    
    func setupImageView() {
        imageView = UIImageView(frame: CGRect(x: 20, y: 400 + 80, width: 150, height: 150))
        imageView.image = UIImage(named: "noImage")
        imageView.userInteractionEnabled = true
        // tapGestureRecoginizer
        let tapGestureRecoginizer = UITapGestureRecognizer(target: self, action: "selectImageFromPhotoLibrary:")
        tapGestureRecoginizer.locationInView(imageView)
        imageView.addGestureRecognizer(tapGestureRecoginizer)
        
        scrollView.addSubview(imageView)
    }
    
    // MARK: Actions
    
    func cancelBarButtonTapped(sender: UIBarButtonItem) {
        self.resignFirstResponder()
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func doneBarButtonTapped(sender: UIBarButtonItem) {
        self.resignFirstResponder()
        let alertView = UIAlertView(title: "请等待审核", message: "请求已发送", delegate: self, cancelButtonTitle: "OK")
        alertView.show()
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        self.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .PhotoLibrary
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func isReadyToEnableDoneButton() -> Bool {
        for view in textsNeedToFill {
            if let textField = view as? UITextField {
                if textField.text?.isEmpty == true {
                    
                    self.navigationItem.rightBarButtonItem?.enabled = false
                    return false
                }
            } else if let textView  = view as? UITextView {
                if textView.text.isEmpty == true {
                    self.navigationItem.rightBarButtonItem?.enabled = false
                    return false
                }
            }
        }
        if newImage == false {
            return false
        }
        self.navigationItem.rightBarButtonItem?.enabled = true
        return true
    }
    
    func undoButtonTapped(sender: UIBarButtonItem) {
        textView.text = ""
    }
    
    func doneButtonTapped(sender: UIBarButtonItem) {
        textView.resignFirstResponder()
    }
}
