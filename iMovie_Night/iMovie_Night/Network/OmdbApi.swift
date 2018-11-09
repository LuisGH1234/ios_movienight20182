//
//  OmdbApi.swift
//  iMovie_Night
//
//  Created by Luis Galindo on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import Alamofire

class OmdbApi {
    static let baseUrl = "http://www.omdbapi.com/"
    
    static func handleError(error: Error) {
        print("Error while requesting Data: \(error.localizedDescription)")
    }
    
    static func getSearch(apikey: String, s: String, responseHandler: @escaping (SearchResponse) -> Void, errorHandler: @escaping (Error) -> Void = handleError) {
        let parameters = ["s": s, "apikey": apikey]
        Alamofire.request(baseUrl, method: .get, parameters: parameters).validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    do {
                        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                        responseHandler(searchResponse)
                    } catch {
                        print("\(error)")
                    }
                case .failure(let error):
                    errorHandler(error)
                }
            }
    }
}
