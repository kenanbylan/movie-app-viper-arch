//
//  MovieDetailPresenter.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import Foundation


class MovieDetailPresenter: MovieDetailViewToPresenter {

    
    var view: MovieDetailPresenterToView?
    var interactor: MovieDetailPresenterToInteractor?
    var router: MovieDetailPresenterToRouter?
    
    var movie: Movie?
    
    
    init(movie: Movie){
        self.movie = movie
    }
    
    func viewDidLoad() {
            
    }
    
    func didSelectVideo() {
        
    }
    
    func didSelectVideoReview() {
        
    }
    
}

extension MovieDetailPresenter: MovieDetailInteractorToPresenter {
    
}
