//
//  HomeManager.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import Foundation
import Alamofire


struct HomeManager {
    
    static let getDiscoverMoviesPath = "/discover/movie?api_key=\(NetworkHelper.apiKey)&language=en-US"
    static let getGenrePath = "/genre/movie/list?api_key=\(NetworkHelper.apiKey)&language=en-US"
    
}












