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
    
    
    static let baseUrl = "https://api.themoviedb.org/3"
    static let apiKey = "6335fd3b6f5e0ca123a23a2cb1fae31c"
    static let baseImgUrl = "https://image.tmdb.org/t/p/w342/"
    
    
    
    func requestUrl(url: String) -> String {
        return NetworkHelper.baseUrl + "/api\(url)"
    }
    
}
