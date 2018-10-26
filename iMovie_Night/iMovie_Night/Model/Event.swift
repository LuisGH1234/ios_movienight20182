//
//  Event.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Event : Codable {
    var participant_event_id: Int
    var event_id: Int
    var name_event: String
    var location: String?
    var date: String? //Verificar si es el tipo correcto
    var rol_id: Int
    var latitude: Decimal?
    var longitude: Decimal?
    var image_url: String?
    var description: String?
}
