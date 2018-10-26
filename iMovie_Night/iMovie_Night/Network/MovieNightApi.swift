//
//  MovieNightApi.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import Alamofire

class MovieNightApi {
    
    static let baseUrl = "url"
    
    static func handleError(error: Error) {
        print("Error while requesting Data: \(error.localizedDescription)")
    }
    
    static func getEventsByUser(token: String, user_id: Int, responseHandler: @escaping (MovieNightResponse<Event>) -> Void, errorHandler: @escaping (Error) -> Void = handleError) {
        Alamofire.request("\(baseUrl)/users/\(user_id)/events").validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    do {
                        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let eventsResponse = try decoder.decode(MovieNightResponse<Event>.self, from: data)
                        responseHandler(eventsResponse)
                    } catch {
                        print("\(error)")
                    }
                case .failure(let error):
                    errorHandler(error)
                }
            }
    }
}
