//
//  SheTuanTableViewCell.swift
//  iZknu_0.02
//
//  Created by Juno on 11/19/15.
//  Copyright © 2015 cn.edu.zknu.jkx. All rights reserved.
//

import UIKit

class SheTuanTableViewCell: UITableViewCell {
    
    var organization: ccOrganization!
    var ccImageView: UIImageView!
    var nameLabel: UILabel!
    var numberOfPeopleLabel: UILabel!
    

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
        let url = organization.headImageUrl
        let ccImageView = UIImageView(frame: CGRect(x: 5, y: 5, width: self.contentView.frame.width / 2, height: 100))
        if let image = UIImage(named: url) {
            ccImageView.image = image
        } else {
            ccImageView.image = UIImage(named: "noImage")
        }
        self.contentView.addSubview(ccImageView)
        
        let x = ccImageView.frame.width + ccImageView.frame.origin.x + CGFloat(15)
        
        nameLabel = UILabel(frame: CGRect(x: x, y: 20, width: 140, height: 20))
        numberOfPeopleLabel = UILabel(frame: CGRect(x: x, y: nameLabel.frame.origin.y + 20 + 20, width: 120, height: 20))
        nameLabel.text = organization.name
        numberOfPeopleLabel.text = "\(organization.numberOfPeople) / \(organization.scale)"
        numberOfPeopleLabel.textAlignment = .Center
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(numberOfPeopleLabel)
        //self.setupImageView()
        //self.setupLabels()
    }
    
    // MARK: - UI
    
    func setupImageView() {
        
    }
    
    func setupLabels() {
        
    }
}
