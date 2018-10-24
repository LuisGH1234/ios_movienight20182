//
//  EventResponse.swift
//  iMovieNight
//
//  Created by Omar Alex on 23/10/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct EventResponse: Codable {
    var status: String
    var events: [Event]?
}
