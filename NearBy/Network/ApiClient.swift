//
//  ApiClient.swift
//  NearBy
//
//  Created by Yusef Naser on 27/11/2021.
//

import Foundation

typealias CompletionHandler <T : Codable> = ( T? , Error? , Int  ) -> ()

enum ResultApi<T:Decodable> {

    case success(T)
    case error(Error)
}

class ApiClient <T : Decodable > {
    
    static func performRequest (route:ApiRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping ( ResultApi<T> , Int )->Void) {
        
        let session = URLSession.shared
        let request = route.asURLRequest()
        let task = session.dataTask(with: request) { (data , response , error) in
            DispatchQueue.main.async {
                var statusCode = -1
                if let httpResponse = response as? HTTPURLResponse {
                    statusCode = httpResponse.statusCode
                }
                if let e = error {
                    completion(.error(e ), statusCode )
                    return
                }
                if let data = data {
                    do{
                        let responseModel = try decoder.decode(T.self, from: data)
                        completion(.success(responseModel), statusCode )
                    }catch(let e){
                        completion(.error(e ), statusCode )
                    }
                }
            }
            
        }
        task.resume()
    }
    
    
    static func performRequestString (route:ApiRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping ( String )->Void) {
        
        let session = URLSession.shared
        let request = route.asURLRequest()
        let task = session.dataTask(with: request) { (data , response , error) in
            DispatchQueue.main.async {
                var statusCode = -1
                if let httpResponse = response as? HTTPURLResponse {
                    statusCode = httpResponse.statusCode
                }
                if let e = error {
                    return
                }
                if let data = data , let string = String(data: data , encoding: .utf8) {
                    completion(string)
                }
            }
            
        }
        task.resume()
    }
    
}
