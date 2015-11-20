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
    //var imageView: UIImageView!
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
        self.setupImageView()
        self.setupLabels()
    }
    
    // MARK: - UI
    
    func setupImageView() {
        let url = organization.headImageUrl
        let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: self.contentView.frame.width / 2, height: 100))
        if let image = UIImage(named: url) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "noImage")
        }
    }
    
    func setupLabels() {
        let x = (self.imageView?.frame.width)! + (self.imageView?.frame.origin.x)! + CGFloat(20)
        nameLabel = UILabel(frame: CGRect(x: x, y: 20, width: 100, height: 20))
        numberOfPeopleLabel = UILabel(frame: CGRect(x: x, y: nameLabel.frame.origin.y + 20 + 20, width: 100, height: 20))
        nameLabel.text = organization.name
        numberOfPeopleLabel.text = "\(organization.numberOfPeople) / \(organization.scale)"
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(numberOfPeopleLabel)
    }
}
