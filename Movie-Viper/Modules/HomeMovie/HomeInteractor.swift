//
//  HomeInteractor.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 24.06.2023.
//

import Foundation

class HomeInteractor {
    var presenter: HomeInteractorToPresenter?
    var service: NetworkService?
    let networkManager = HomeService.shared

}


extension HomeInteractor: HomePresenterToInteractor {
    
    
    func getGenres() {
        
    }
    
    func getMovieListDiscover() {
        networkManager.getDiscoverMovies { movies, error in
            if let error = error {
                print("Error getCharacterItems : \(error.localizedDescription)")
                
            } else {
                if let movies = movies {
                    self.didSuccessGetMovieListDiscover(response: movies.results)
                  
                }
            }

            
        }
    }
}


extension HomeInteractor: MovieListDiscover {
    
    func didSuccessGetMovieListDiscover(response: [Movie]) {
        presenter?.didSuccessGetMovieListDiscover(response: response)
    }
    
    func didFailedGetMovieListDiscover(error: String) {
        presenter?.didFailedGetMovieListDiscover(error: error)
    }
    
    
    
}
