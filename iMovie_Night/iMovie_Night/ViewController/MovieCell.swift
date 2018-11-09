//
//  MovieCell.swift
//  iMovie_Night
//
//  Created by Omar Alex on 8/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var image_movie: UIImageView!
    @IBOutlet weak var name_director: UILabel!
    @IBOutlet weak var name_movie: UILabel!
    
    @IBOutlet weak var description_movie: UILabel!
    
    func update(from title: Title) {
        image_movie.setImage(fromUrlString: title.imdbID,
                             withDefaultNamed: "no-image-available",
                            withErrorNamed: "no-image-available")
        name_director.text = title.Director
        name_movie.text = title.Title
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
