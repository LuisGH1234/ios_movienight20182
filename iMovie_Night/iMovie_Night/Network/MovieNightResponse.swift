//
//  ObjectResponse.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct MovieNightResponse<T : Codable> : Codable {
    var status: String
    var response: [T]?
}
