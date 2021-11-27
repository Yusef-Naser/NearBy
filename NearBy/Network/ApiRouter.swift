//
//  ApiRouter.swift
//  NearBy
//
//  Created by Yusef Naser on 27/11/2021.
//

import Foundation


public protocol URLRequestConvertible {
    func asURLRequest() -> URLRequest
}

enum ApiRouter : URLRequestConvertible {
    
    case getPlaces (data : [String : String])
    
    
    private var Methods : String {
        switch self {
        case .getPlaces  :
            return "GET"
        }
    }
    
    private var Headers : [String : String] {
        switch self {
        case .getPlaces :
            return [
                "Accept" : "application/json",
                Constants.Parameters.Authorization : Constants.Auth
            ]
        }
    }
    
    private var Paths : String {
        switch self {
        case .getPlaces(let data ):
            let s = changeDictionaryToQueryURL(dic: data )
           return "/search?\(s)"
        }
    }
    
    func asURLRequest() -> URLRequest {
        let url = "\(Constants.BaseURL)\(Paths)"
        let safeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var urlRequest = URLRequest(url: URL(string: safeUrl!)!)
        urlRequest.allHTTPHeaderFields = Headers
        return urlRequest
    }
    
    func changeDictionaryToQueryURL (dic : [String : String]) -> String {
        var stringArray : [String] = []
        
        dic.forEach { (item) in
            if !item.value.isEmpty {
                stringArray.append("\(item.key)=\(item.value)")
            }else {
                stringArray.append("\(item.key)")
            }
        }
        
        var str = ""
        
        stringArray.forEach { (s) in
            if str.isEmpty {
                str = s
            }else {
                str = str + "&" + s
            }
        }
        
        return str
    }
    
    
}
