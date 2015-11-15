//
//  NewSheTuanViewController.swift
//  iZknu_0.02
//
//  Created by Juno on 11/3/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class NewSheTuanViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var scrollView: UIScrollView!
    var sheTuanJianJieTextView: UITextView!
    var haiBaoImageView: UIImageView!
    var pickerView: UIPickerView!
    
    let types = ["全部类型","学术", "艺术", "公益", "爱好", "社会实践", "官方组织", "其它类型"]
    let levels = ["校级", "院级"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        view = scrollView
        self.setupPickerView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: UITextViewDelegate
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        scrollView.contentOffset.y = 0
        return true
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        scrollView.contentOffset.y = 120
    }
    
    // MARK: UIImagePickerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        haiBaoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - PickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return types.count
        case 1: return levels.count
        default: return 0
        }
    }
    
    // MARK: - PickerViewDelegate

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0: return types[row]
        case 1: return levels[row]
        default: return ""
        }
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 150
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 20
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
            //label.textAlignment = .Center
            label.textColor = UIColor.blackColor()
            label.font = UIFont.systemFontOfSize(12)
            label.text = self.pickerView(pickerView, titleForRow: row, forComponent: component)
            return label
        }
        return view!
    }
    
    // MARK: UI
    func setupView() {
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 1.4)
        scrollView.backgroundColor = UIColor.whiteColor()
        
        // labels
        let mingChengLabel = UILabel(frame: CGRect(x: 20, y: 80, width: 70, height: 20))
        let leiXingLabel =  UILabel(frame: CGRect(x: 20, y: 120, width: 70, height: 20))
        let jiBieLabel = UILabel(frame: CGRect(x: 150, y: 120, width: 70, height: 20))
        let jianJieLabel = UILabel(frame: CGRect(x: 20, y: 200, width: 70, height: 20))
        let haiBaoLabel = UILabel(frame: CGRect(x: 20, y: 350, width: 70, height: 20))
        
        mingChengLabel.text = "社团名称"
        leiXingLabel.text = "社团类型"
        jiBieLabel.text = "社团级别"
        jianJieLabel.text = "社团简介"
        haiBaoLabel.text = "上传海报"
        
        scrollView.addSubview(mingChengLabel)
        scrollView.addSubview(leiXingLabel)
        scrollView.addSubview(jiBieLabel)
        scrollView.addSubview(jianJieLabel)
        scrollView.addSubview(haiBaoLabel)
        
        //textField
        let mingChengTextField = UITextField(frame: CGRect(x: 120, y: 80, width: 150, height: 20))
        mingChengTextField.delegate = self
        mingChengTextField.layer.borderColor = UIColor.grayColor().CGColor
        mingChengTextField.layer.borderWidth = 0.5
        mingChengTextField.layer.cornerRadius = 3.0
        mingChengTextField.textColor = UIColor.grayColor()
        mingChengTextField.textAlignment = .Center
        mingChengTextField.returnKeyType = .Done
        mingChengTextField.placeholder = "请输入社团名称"
        mingChengTextField.font = UIFont.systemFontOfSize(11)
        scrollView.addSubview(mingChengTextField)
        
      /*  let jibieTextField = UITextField(frame: CGRect(x: 120, y: 160, width: 150, height: 20))
        jibieTextField.delegate = self
        jibieTextField.layer.borderColor = UIColor.grayColor().CGColor
        jibieTextField.layer.borderWidth = 0.5
        jibieTextField.layer.cornerRadius = 3.0
        jibieTextField.textColor = UIColor.grayColor()
        jibieTextField.textAlignment = .Center
        jibieTextField.returnKeyType = .Done
        jibieTextField.placeholder = "院级／校级"
        jibieTextField.font = UIFont.systemFontOfSize(11)
        scrollView.addSubview(jibieTextField)*/
        
        // textView
        sheTuanJianJieTextView = UITextView(frame: CGRect(x: 20, y: 230, width: 280, height: 100))
        sheTuanJianJieTextView.delegate = self
        sheTuanJianJieTextView.textColor = UIColor.grayColor()
        sheTuanJianJieTextView.layer.borderColor = UIColor.grayColor().CGColor
        sheTuanJianJieTextView.layer.cornerRadius = 5
        sheTuanJianJieTextView.layer.borderWidth = 0.5
        sheTuanJianJieTextView.font = UIFont.systemFontOfSize(11)
        
        // 键盘上的工具栏
        let textViewToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
        let undoButton = UIBarButtonItem(title: "全清", style: .Plain, target: self, action: "undoButtonTapped:")
        let space = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "完成", style: .Done, target: self, action: "doneButtonTapped:")
        textViewToolBar.items  = [undoButton, space, doneButton]
        sheTuanJianJieTextView.inputAccessoryView = textViewToolBar
        scrollView.addSubview(sheTuanJianJieTextView)
        
        // haiBaoImageView
        haiBaoImageView = UIImageView(frame: CGRect(x: 20, y: 380, width: 150, height: 150))
        haiBaoImageView.image = UIImage(named: "noImage")
        haiBaoImageView.userInteractionEnabled = true
        // tapGestureRecoginizer
        let tapGestureRecoginizer = UITapGestureRecognizer(target: self, action: "selectImageFromPhotoLibrary:")
        tapGestureRecoginizer.locationInView(haiBaoImageView)
        haiBaoImageView.addGestureRecognizer(tapGestureRecoginizer)
        
        scrollView.addSubview(haiBaoImageView)
        
        // finishButton
        let finishButton = UIButton(type: .System)
        finishButton.frame = CGRect(x: 100, y: 560, width: 100, height: 20)
        finishButton.setTitle("申请创建", forState: .Normal)
        finishButton.addTarget(self, action: "finishButtonTapped:", forControlEvents: .TouchDown)
        scrollView.addSubview(finishButton)
    }
    
    func setupPickerView() {
        pickerView = UIPickerView(frame: CGRect(x: 20, y: 140, width: 250, height: 60))
        pickerView.autoresizingMask = .FlexibleHeight
        pickerView.delegate = self
        pickerView.dataSource = self
        self.scrollView.addSubview(pickerView)
    }
    
    
    // MARK: Actions
    
    // jianJianTextView
    func undoButtonTapped(sender: UIBarButtonItem) {
        sheTuanJianJieTextView.text = ""
    }
    
    func doneButtonTapped(sender: UIBarButtonItem) {
        sheTuanJianJieTextView.resignFirstResponder()
    }
    
    // tapGestureRecognizer
    func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        sheTuanJianJieTextView.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .PhotoLibrary
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func finishButtonTapped(sender: UIButton) {
        print("申请创建")
        self.navigationController?.pushViewController(UIViewController(), animated: true)
    }

}
