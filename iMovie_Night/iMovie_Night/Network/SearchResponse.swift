//
//  SearchResponse.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct SearchResponse : Codable {
    var Search: [Title]?
    var totalResults: String?
    var Response: String?
}
