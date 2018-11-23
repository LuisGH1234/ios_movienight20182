	//
//  MovieViewController.swift
//  iMovie_Night
//
//  Created by Alumnos on 11/9/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var pictureMovie: UIImageView!
    @IBOutlet weak var labelMovie: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelCast: UILabel!
    
    var titleu: Title?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let titleu = titleu,
            let pictureMovie = pictureMovie,
            let labelMovie = labelMovie,
            let labelDescription = labelDescription,
            let labelCast = labelCast {
            pictureMovie.setImage(fromUrlString: titleu.Poster!, withDefaultNamed: "no-image-available", withErrorName: "no-image-available")
            labelMovie.text = titleu.Title
            labelDescription.text = titleu.Released
            labelCast.text = titleu.Released
        }
    }
    
    
}

