//
//  EventViewController.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 11/8/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameTextView: UILabel!
    @IBOutlet weak var descriptionTextView: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    //@IBOutlet weak var locationLabel: UILabel!
    //@IBOutlet weak var dateLabel: UILabel!
    var event: Event?
    let noImage = "pop_corn_one"
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        if let event = event {
            pictureImageView.setImage(fromUrlString: event.image_url!, withDefaultNamed: noImage, withErrorName: noImage)
            if (event.name_event?.isEmpty == false){
                nameTextView.text = event.name_event
            }
            if (event.description?.isEmpty == false){
                descriptionTextView.text = event.description
            }
            if (event.location?.isEmpty == false){
                locationLabel.text = event.location
            }
            if (event.date?.isEmpty == false){
                dateLabel.text = event.date
            }
        }
    }
    
}
