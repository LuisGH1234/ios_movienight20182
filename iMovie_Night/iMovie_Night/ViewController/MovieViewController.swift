//
//  MovieViewController.swift
//  iMovie_Night
//
//  Created by Omar Alex on 8/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var image_movie: UIImageView!
    @IBOutlet weak var name_movie: UILabel!
    @IBOutlet weak var cast_movie: UILabel!
    @IBOutlet weak var description_movie: UILabel!
    
    var ttitle: Title?
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let ttitle = ttitle,
            let image_movie = image_movie,
            let name_movie = name_movie,
            let cast_movie = cast_movie,
            let description_movie = description_movie {
            image_movie.setImage(fromUrlString: ttitle.imdbID,
                                 withDefaultNamed: "no-image-available",
                                 withErrorNamed: "no-image-available")
            name_movie.text = ttitle.Title
            cast_movie.text = ttitle.Actors
            description_movie.text = ttitle.Released
        }
        
    }
    /*
     override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
     if  let article = article,
     let pictureImageView = pictureImageView,
     let urlToImage = article.urlToImage,
     let titleLabel = titleLabel,
     let descriptionLabel = descriptionLabel,
     let contentLabel = contentLabel {
     pictureImageView.setImage(fromUrlString: urlToImage, withDefaultNamed: "no-image-available", withErrorNamed: "no-image")
     titleLabel.text = article.title
     descriptionLabel.text = article.description
     contentLabel.text = article.content
     }
     }

     
     */
    }
