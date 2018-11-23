//
//  MovieCell.swift
//  iMovie_Night
//
//  Created by Omar Chavez on 11/9/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    

    @IBOutlet weak var pictureMovie: UIImageView!
    @IBOutlet weak var labelDirector: UILabel!
    @IBOutlet weak var labelMovie: UILabel!
    @IBOutlet weak var labelStart: UILabel!
    
    func update(from title: Title) {
        pictureMovie.setImage(fromUrlString: title.Poster!, withDefaultNamed: "no-image-available", withErrorName: "no-image-available")
        labelDirector.text = title.Director
        labelMovie.text = title.Title
        labelStart.text = title.Rated
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
