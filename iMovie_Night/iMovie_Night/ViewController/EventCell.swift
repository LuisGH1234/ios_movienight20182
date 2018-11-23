//
//  EventCell.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 11/8/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let noImageAvailable = "pop_corn_one"
    
    func update(from event: Event) {
        pictureImageView.setImage(fromUrlString: event.image_url!, withDefaultNamed: noImageAvailable, withErrorName: noImageAvailable)
        if (event.name_event?.isEmpty == false){
            nameLabel.text = event.name_event
        }
        if (event.description?.isEmpty == false){
            descriptionLabel.text = event.description
        }
        
    }

}
