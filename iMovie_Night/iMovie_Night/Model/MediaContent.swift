//
//  MediaContent.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct MediaContent : Codable {
    var id: Int
    var imdb_id: String?
    var title: String
    var year: String
    var image_url: String?
}
