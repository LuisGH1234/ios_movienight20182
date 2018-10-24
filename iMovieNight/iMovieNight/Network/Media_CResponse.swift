//
//  Media_CResponse.swift
//  iMovieNight
//
//  Created by Omar Alex on 23/10/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Media_CResponse: Codable {
    var status: String
    var media_contents: [MediaContent]?
}
