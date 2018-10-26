//
//  Responsibility.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Responsibility : Codable {
    var id: Int
    var product_name: String
    var description: String?
    var user_id: Int?
    var event_id: Int?
}
