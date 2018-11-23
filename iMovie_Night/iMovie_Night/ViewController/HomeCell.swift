//
//  HomeCell.swift
//  iMovie_Night
//
//  Created by Karen Galindo on 11/23/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userpicImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventnameLabel: UILabel!
    
    var item: HomeItem?
    
    func update(from item: HomeItem){
        self.item = item
        if self.item != nil {
            eventImageView.setImage(fromUrlString: self.item!.event_image_url!, withDefaultNamed: "pop_corn_one", withErrorName: "pop_corn_one")
            userpicImageView.setImage(fromUrlString: self.item!.user_image_url!, withDefaultNamed: "no-image-available", withErrorName: "no-image-available")
            usernameLabel.text = self.item!.user_name
            dateLabel.text = self.item!.create_date
            descriptionLabel.text = self.item!.description
            eventnameLabel.text = self.item!.event_name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userpicImageView.layer.borderWidth = 1
        userpicImageView.layer.masksToBounds = false
        userpicImageView.layer.borderColor = UIColor.black.cgColor
        userpicImageView.layer.cornerRadius = userpicImageView.frame.height/2
        userpicImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
