//
//  Playlist.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Playlist : Codable {
    var id: Int
    var name: String
    var original: Bool
    var description: String?
    var image_url: String?
}
