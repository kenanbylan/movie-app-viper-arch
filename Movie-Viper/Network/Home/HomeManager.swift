//
//  HomeManager.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import Foundation
import Alamofire


enum HomeManager {
    
    case getGenre
    case getMoviesByGenre(genreId: String)
    case getAllMovieList
    case getNewMovie
    
    
    //MARK: Düzenlenecektir.
    var path: String {
        switch self {
            
        case .getGenre:
            return "genre/movie/list"
        case .getMoviesByGenre(genreId: let genreId):
            return "discover/movie"
        case .getAllMovieList:
            return "\(NetworkHelper.shared.baseUrl)discover/movie"
        case .getNewMovie:
            return "discover/movie/new"
        }
    }
    
}












