//
//  Title.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Title : Codable {
    //From Search
    var imdbID: String
    var Title: String
    var Year: String
    var `Type`: String?
    var Poster: String?
    //From ID or Title and Year
    var Rated: String?
    var Released: String?
    var RunTime: String?
    var Genre: String?
    var Director: String?
    var Writer: String?
    var Actors: String?
    var Plot: String?
    var Language: String?
    var Country: String?
    var Production: String?
    var Website: String?
    var Response: String?
}
