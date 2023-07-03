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



//Service atılan istek burada alınır ve presenterdaki arraylere iletilir.
extension HomeInteractor: HomePresenterToInteractor {
    
    func getGenres() {
        networkManager.getGenre { genres, error in
            if let error = error {
                self.didFailedGetGenre(error: error.localizedDescription)
                print("Error getGenre: \(error.localizedDescription)")
            } else {
                print("NO hata genress")
                if let genres = genres {
                    self.didSuccesGetGenre(response: genres.genres)
                }
            }
            
        }
    }
    
    
    func getMovieListDiscover() {
        networkManager.getDiscoverMovies { movies, error in
            if let error = error {
                self.didFailedGetMovieListDiscover(error: error.localizedDescription)
                print("Error getDiscoverMovies : \(error.localizedDescription)")
                
            } else {
                if let movies = movies {
                    self.didSuccessGetMovieListDiscover(response: movies.results)
                }
            }
        }
    }
    
}



//Presenter sayfasına gönderilen fonksiyonlar.
extension HomeInteractor: MovieListDiscover, GenreList  {
    
    func didSuccessGetMovieListDiscover(response: [Movie]) {
        presenter?.didSuccessGetMovieListDiscover(response: response)
    }
    
    func didFailedGetMovieListDiscover(error: String) {
        presenter?.didFailedGetMovieListDiscover(error: error)
    }
    
    func didSuccesGetGenre(response: [Genre]) {
        presenter?.didSuccessGetGenre(response: response)
    }
    
    func didFailedGetGenre(error: String) {
        presenter?.didFailedGetGenre(error: error)
    }
    
    
    
}
