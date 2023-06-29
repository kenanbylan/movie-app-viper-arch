//
//  HomeNetwork.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import Foundation


protocol HomeServiceProtocol {
    func getDiscoverMovies(completion: @escaping((Movies?, Error?)->()))
}


protocol MovieListDiscover: AnyObject {
    func didSuccessGetMovieListDiscover(response: [Movie])
    func didFailedGetMovieListDiscover(error: String)
}


class HomeService: HomeServiceProtocol {

    
    
    
    static let shared = HomeService()
    var movieListDiscover: MovieListDiscover?
    
    
    func getDiscoverMovies(completion: @escaping ((Movies?, Error?) -> ())) {
        let url = "https://api.themoviedb.org/3/discover/movie?api_key=6335fd3b6f5e0ca123a23a2cb1fae31c&language=en-US"
        NetworkService.shared.request(type: Movies.self, url: url, method: .get) { response in
            
            switch response {
                
            case .success(let movies):
                completion(movies, nil)

            case .failure(let error):
                print("Errror", error.localizedDescription)
                completion(nil, error)
            }
            
        }
    }
    
//
//    func gqetDiscoverMovies() {
//        print("URL: ",url)
//        NetworkService.shared.request(type: Movies.self , url: url, method: .get) { response in
//
//            switch response {
//            case .success(let movies):
//                self.movieListDiscover?.didSuccessGetMovieListDiscover(response: movies.results)
//               // complete(movies, nil)
//
//            case .failure(let error):
//                print("Errror", error.localizedDescription)
//                self.movieListDiscover?.didFailedGetMovieListDiscover(error: error.localizedDescription)
//               // complete(nil, error)
//            }
//
//        }
//    }
    
}
