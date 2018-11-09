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
    
    static let baseUrl = "http://nodejsmovienight20182.herokuapp.com/api/v2/"
    
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
    
    static func postLoginUrl (Email email : String, Password password: String,responseHandler: @escaping(SigninResponse) -> (Bool),
    errorHandler: (@escaping(Error) -> (Void))=handleError){
        let parameters: [String: Any] = ["email": email, "password": password]
       Alamofire.request("\(baseUrl)signin",
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default)
            .validate()
            .responseJSON(completionHandler: {(response) in
                switch response.result{
                case .success(let value):
                    do{
                        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let signinResponse = try decoder.decode(SigninResponse.self, from: data)
                        if responseHandler(signinResponse){
                            
                            if let tokenResponse = response.response!.allHeaderFields["Token"] as? String{
                               //print("Response TOKEN:\(tokenResponse)")
                                let userId = String(tokenResponse.suffix(2))
                                let index = tokenResponse.index(tokenResponse.endIndex, offsetBy: -3)
                                let token = tokenResponse[...index]
                                print("UserId:\(userId)")
                                print("Token:\(token)")
                                //GlobalVariables.Token = String(token)
                                //GlobalVariables.userId = Int(userId)
                            }
                        }
                    }
                    catch{
                        print("\(error)")
                    }
                case .failure(let error):
                    errorHandler(error)
                }
            })
        
    }
    
    public static var postRegisterUrl:String{
        return "\(baseUrl)signup" }
}
