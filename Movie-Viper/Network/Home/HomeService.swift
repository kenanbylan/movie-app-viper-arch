//
//  HomeNetwork.swift
//  viper-fetch-example
//  Created by Kenan Baylan on 27.06.2023.

import Foundation


protocol HomeServiceProtocol {
    func getDiscoverMovies(completion: @escaping((Movies?, Error?)->()))
    func getGenre(completion: @escaping((Genres?, Error?)->()))
}

protocol MovieListDiscover: AnyObject {
    func didSuccessGetMovieListDiscover(response: [Movie])
    func didFailedGetMovieListDiscover(error: String)
}

protocol GenreList: AnyObject {
    func didSuccesGetGenre(response: [Genre])
    func didFailedGetGenre(error: String)
}

class HomeService: HomeServiceProtocol {
    
    static let shared = HomeService()
    var movieListDiscover: MovieListDiscover?
    
    
    func getDiscoverMovies(completion: @escaping ((Movies?, Error?) -> ())) {
        let url = HomeManager.baseUrl + HomeManager.getDiscoverMoviesPath
        
        NetworkService.shared.request(type: Movies.self, url: url, method: .get) { response in
            
            switch response {
            case .success(let movies):
                completion(movies, nil)
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    
    func getGenre(completion: @escaping ((Genres?, Error?) -> ())) {
        
        let url = HomeManager.baseUrl + HomeManager.getGenrePath
        
        NetworkService.shared.request(type: Genres.self, url: url, method: .get) { response in
            switch response {
            case .success(let genres):
                
                completion(genres,nil)
                
            case .failure(let error):
                print("Error: ",error)
                completion(nil, error)
            }
            
        }
    }
    
}
