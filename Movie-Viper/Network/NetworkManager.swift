//
//  NetworkManager.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 24.06.2023.
//

import Foundation

enum ErrorTypes: String, Error {
    
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    static let apiKey = "930fe530d711d2b1367b8acb0dacc7f1"
     let baseUrl = "https://api.themoviedb.org/3/"
    
    
    func requestUrl(url: String) -> String {
       return baseUrl + "/api\(url)"
    }
    
}
