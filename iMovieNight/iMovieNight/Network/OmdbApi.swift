//
//  OmdbApi.swift
//  iMovieNight
//
//  Created by Omar Alex on 23/10/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import Alamofire

class OmdbApi {
    static let baseUrl = "http://www.omdbapi.com/"
    
    static func handleError(error: Error) {
        print("Error while requesting Data: \(error.localizedDescription)" )
    }
    
    static func getSearch(apikey: String, word: String,
                              responseHandler: (@escaping (SearchResponse) -> (Void)),
                              errorHandler: (@escaping (Error)-> (Void)) = handleError){
        let parameters = ["apikey": apikey, "word": word]
        Alamofire.request(baseUrl, method: .get, parameters: parameters)
            .validate()
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                    case .success(let value):
                        do {
                            let data = try JSONSerialization.data(
                                withJSONObject: value, options: .prettyPrinted)
                            let decoder = JSONDecoder()
                            let searhResponse = try decoder.decode(
                                SearchResponse.self, from: data)
                                responseHandler(searhResponse)
                        } catch {
                            print("\(error)")
                    }
                case .failure(let error):
                        errorHandler(error)
                }
            })
        
    }
}


/*
 .validate()
 .responseJSON(completionHandler: { (response) in
 switch response.result {
 case .success(let value):
 do {
 let data = try JSONSerialization.data(
 withJSONObject: value, options: .prettyPrinted)
 let decoder = JSONDecoder()
 let sourcesResponse = try decoder.decode(
 SourcesResponse.self, from: data)
 responseHandler(sourcesResponse)
 } catch {
 print("\(error)")
 }
 case .failure(let error):
 errorHandler(error)
 }
 })
 */
