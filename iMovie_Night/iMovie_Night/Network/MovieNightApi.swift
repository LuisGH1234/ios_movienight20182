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
    
    static let baseUrl = "http://movienight21012.herokuapp.com/api/v2/"
    
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
        let url = "\(baseUrl)users/\(user_id)/events"
        get(token: token, urlString: url, responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
    static func getMyUser(token: String, user_id: Int, responseHandler: @escaping (User) -> Void, errorHandler: @escaping (Error) -> Void = handleError) {
        let url = "\(baseUrl)users/\(user_id)"
        get(token: token, urlString: url, responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
    static func getHomeItems(token: String, user_id: Int, responsehandler: @escaping (MovieNightResponse<HomeItem>) -> Void, erroHandler: @escaping (Error) -> Void = handleError) {
        let url = "\(baseUrl)home/users/\(user_id)"
        get(token: token, urlString: url, responseHandler: responsehandler)
    }
    
    static func postLogin (Email email : String, Password password: String,responseHandler: @escaping(SigninResponse) -> (Bool),
                              errorHandler: (@escaping(Error) -> (Void))=handleError){
       let parameters: [String: Any] = ["email": email, "password": password]
        //let parameters: [String: Any] = ["email": "CesarCas@hotmail.com", "password": "miupc.456."]
       Alamofire.request("\(baseUrl)signin",
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default)
            .validate()
            .responseJSON(completionHandler: {(response) in
                switch response.result{
                case .success(let value):
                    do{
                        print("Success")
                        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let signinResponse = try decoder.decode(SigninResponse.self, from: data)
                        if responseHandler(signinResponse){                            
                            if let tokenResponse = response.response!.allHeaderFields["Token"] as? String{
                                let tokenSeparated = tokenResponse.split(separator: " ")
                                let token = tokenSeparated.first!
                                let userId = Int(tokenSeparated.last!)
                                UserStore.shared.userToken = String(token)
                                UserStore.shared.userId = userId!
                                print("UserId: \(userId!)")
                                print("Token: \(token)")
                            }
                        } 
                    }catch{
                        print("\(error)")
                    }
                case .failure(let error):
                    print("Failure")
                    errorHandler(error)
                }
            })
        
    }
    
    static func postRegister(Firstname firstname: String,Email email : String, Password password: String,responseHandler: @escaping(SignupResponse) -> (Void), errorHandler: (@escaping(Error) -> (Void))=handleError){
        let parameters: [String: Any] = ["firstname": firstname,"email": email, "password": password]
        //let parameters: [String: Any] = ["email": "CesarCas@hotmail.com", "password": "miupc.456."]
        Alamofire.request("\(baseUrl)signup",
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default)
            .validate()
            .responseJSON(completionHandler: {(response) in
                switch response.result{
                case .success(let value):
                    do{
                        print("Success")
                        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let signupResponse = try decoder.decode(SignupResponse.self, from: data)
                        responseHandler(signupResponse)
                        
                    }catch{
                        print("\(error)")
                    }
                case .failure(let error):
                    print("Failure")
                    errorHandler(error)
                }
            })
    
    }
    static private func post <T: Decodable>(urlString: String,
                                            parameters: [String : Any],
                                            responseType: T.Type,
                                            responseHandler: @escaping (T) -> Void,
                                            errorHandler: @escaping (Error) -> Void = handleError){
        let headers = ["Content-Type": "application/json","authorization": UserStore.shared.userToken]
        Alamofire.request("\(urlString)",
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: headers)
            .validate()
            .responseJSON(completionHandler: {(response) in
                switch response.result{
                case .success(let value):
                    do{
                        
                        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let dataResponse = try decoder.decode(responseType.self, from: data)
                        print("Success")
                        responseHandler(dataResponse)
                        
                    }catch{
                        print("\(error)")
                    }
                case .failure(let error):
                    print("Failure")
                    errorHandler(error)
                }
            })
    }
    static func postEvent(Name :String, Description: String, responseHandler: @escaping (PostResponse) -> Void, errorHandler: @escaping (Error) -> Void = handleError) {
        let url = "\(baseUrl)events"
        let parameters: [String: Any] = ["name":Name, "user_id": UserStore.shared.userId, "rol_id":11, "image_url": "URL","description": Description]
        post(urlString: url, parameters: parameters, responseType: PostResponse.self, responseHandler: responseHandler, errorHandler: errorHandler)
    }
}
