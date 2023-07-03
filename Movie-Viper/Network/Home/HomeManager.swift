//
//  HomeManager.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import Foundation
import Alamofire


struct HomeManager {
    
    static let baseUrl = "https://api.themoviedb.org/3"
    static let apiKey = "6335fd3b6f5e0ca123a23a2cb1fae31c"
    static let baseImgUrl = "https://image.tmdb.org/t/p/w342/"
    
    static let getDiscoverMoviesPath = "/discover/movie?api_key=\(apiKey)&language=en-US"
    static let getGenrePath = "/genre/movie/list?api_key=\(apiKey)&language=en-US"
 
    
}












