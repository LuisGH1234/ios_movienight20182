//
//  Event.swift
//  iMovieNight
//
//  Created by Omar Alex on 23/10/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Event: Codable {
    var id: Int
    var name: String?
    var location: String?
    var data: String?
}
