//
//  Snacklist.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Snacklist : Codable {
    var id: Int
    var name: String
    var original: Bool
    var description: String?
}
