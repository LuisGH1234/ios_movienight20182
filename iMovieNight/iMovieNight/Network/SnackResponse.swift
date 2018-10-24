//
//  SnackResponse.swift
//  iMovieNight
//
//  Created by Omar Alex on 23/10/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct SnackResponse: Codable {
    var status: String
    var id: Int?
    var snacklist_id: Int?
    var name: String?
    var trademark: String?
    var snacks: [Snack]?
}
