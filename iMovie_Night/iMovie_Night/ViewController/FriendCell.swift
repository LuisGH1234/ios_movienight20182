
//
//  FriendCell.swift
//  iMovie_Night
//
//  Created by Omar Alex on 23/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    
    @IBOutlet weak var pictureFriend: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var friendLabel: UILabel!
    
    func update(from friend: Friend) {
        
        pictureFriend.setImage(fromUrlString: friend.image_url!, withDefaultNamed: "no-image-available", withErrorName: "no-image-available")
        idLabel.text = friend.id!.description
        friendLabel.text = friend.firstname!.description
    }
    
}

