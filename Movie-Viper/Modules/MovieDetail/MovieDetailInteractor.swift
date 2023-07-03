//
//  MovieDetailInteractor.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import Foundation


class MovieDetailInteractor {
    
    var presenter: MovieDetailInteractorToPresenter?
    var service: NetworkService?
    //let networkManager = HomeService.shared
    
}


extension MovieDetailInteractor: MovieDetailPresenterToInteractor {
    
    
    func getReviews(movieId: String) {
        
    }
    
    func getVideo(movieId: String) {
        
    }
    
}


extension MovieDetailInteractor: MovieDetailInteractorToPresenter {
    
    //TODO: Will be added.
    
    //    func didSuccessGetReview(reviews: [Review])
    //    func didFailed(response: String)
    //    func didSuccessGetVideo(videos: Videos)
    //    func didFailedGetVideo(response: String)
    //
    
}

