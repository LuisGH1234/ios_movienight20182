//
//  SnackListResponse.swift
//  iMovieNight
//
//  Created by Omar Alex on 23/10/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct SnackListResponse: Codable {
    var status: String
    var id: Int?
    var event_id: Int?
    var name: String?
    var original: Bool?
    var description: String?
    var snacklist: [SnackList]?
}
