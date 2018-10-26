//
//  User.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct User : Codable {
    var user_code: CLong
    var phone: String?
    var firstname: String
    var lastname: String
    var email: String
    var image_url: String?
}
