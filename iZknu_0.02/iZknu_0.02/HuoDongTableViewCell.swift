//
//  HuoDongTableViewCell.swift
//  iZknu_0.02
//
//  Created by Juno on 11/21/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class HuoDongTableViewCell: UITableViewCell {

    var activity: ccOrgActivity!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //images
        let url = activity.headImageUrl
        let ccImageView = UIImageView(frame: CGRect(x: 5, y: 5, width: self.contentView.frame.width / 2, height: 100))
        if let image = UIImage(named: url) {
            ccImageView.image = image
        } else {
            ccImageView.image = UIImage(named: "noImage")
        }
        self.contentView.addSubview(ccImageView)
        
        //labels
        let x = ccImageView.frame.width + ccImageView.frame.origin.x + CGFloat(15)
        let labelTexts = ["活动名称", "活动时间", "报名人数", "发布时间"]
        
        for (index, text) in labelTexts.enumerate() {
            let label = UILabel(frame: CGRect(x: x, y: 20 * CGFloat(index + 1), width: 80, height: 20))
            label.font = UIFont.systemFontOfSize(11)
            label.text = text
            self.contentView.addSubview(label)
        }
        
        let textFieldTests = [activity.name, activity.holdTime, "\(activity.peopleNow) / \(activity.peopleMost)", activity.postTime]
        for (index, text) in textFieldTests.enumerate() {
            let textField = UITextField(frame: CGRect(x: x + 60, y: 20 * CGFloat(index + 1), width: 80, height: 20))
            textField.text = text
            textField.userInteractionEnabled = false
            textField.font = UIFont.systemFontOfSize(11)
            textField.textColor = UIColor.grayColor()
            self.contentView.addSubview(textField)
        }
        
        
        /*nameLabel = UILabel(frame: CGRect(x: x, y: 20, width: 140, height: 20))
        numberOfPeopleLabel = UILabel(frame: CGRect(x: x, y: nameLabel.frame.origin.y + 20 + 20, width: 120, height: 20))
        nameLabel.text = organization.name
        numberOfPeopleLabel.text = "\(organization.numberOfPeople) / \(organization.scale)"
        numberOfPeopleLabel.textAlignment = .Center
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(numberOfPeopleLabel)*/
    }

}
