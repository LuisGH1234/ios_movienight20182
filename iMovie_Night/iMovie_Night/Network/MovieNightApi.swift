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
    
    static let baseUrl = "https://nodejsmovienight20182.herokuapp.com/api/v2/"
    
    static func handleError(error: Error) {
        print("Error while requesting Data: \(error.localizedDescription)")
    }
    
    static private func get <T: Decodable>(token: String, urlString: String, responseHandler: @escaping (T) -> Void, errorHandler: @escaping (Error) -> Void = handleError){
        let headers = ["authorization": token]
        Alamofire.request(urlString, method: .get, headers: headers).validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print(value)
                    do {
                        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let eventsResponse = try decoder.decode(T.self, from: data)
                        responseHandler(eventsResponse)
                    } catch {
                        print("\(error)")
                    }
                case .failure(let error):
                    errorHandler(error)
                }
        }
    }
    
    static func getEventsByUser(token: String, user_id: Int, responseHandler: @escaping (MovieNightResponse<Event>) -> Void, errorHandler: @escaping (Error) -> Void = handleError) {
        let url = "\(baseUrl)/users/\(user_id)/events"
        get(token: token, urlString: url, responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
    public static var postLoginUrl:String{
        return "\(baseUrl)signin" }
    
    public static var postRegisterUrl:String{
        return "\(baseUrl)signup" }
}
