//
//  MovieDetailContract.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import Foundation



// view --> presenter
protocol MovieDetailViewToPresenter: AnyObject {
    
    var view: MovieDetailPresenterToView? { get set }
    var interactor: MovieDetailPresenterToInteractor? { get set }
    var router: MovieDetailPresenterToRouter? { get set }
        
    
    var movie: Movie? {get set} //seçilen movie
    
    
    func viewDidLoad()
    func didSelectVideo() // TODO: will be parameters added.
    func didSelectVideoReview()   // TODO: will be parameters added.
    
    
}

//Presenter --> Viewa gidecekler.
protocol MovieDetailPresenterToView: AnyObject {
    
    var presenter: MovieDetailViewToPresenter? {get set}
    
    func getData()
    func showLoading()
    func hideLoading()
    
}


// presenter--> interactor
protocol MovieDetailPresenterToInteractor: AnyObject {
    
    var presenter: MovieDetailInteractorToPresenter? { get set }
    //var networkService:  Network eklenebilir
    
    func getReviews(movieId: String)
    func getVideo(movieId: String)
    
}


// interactor ---> presenter
protocol MovieDetailInteractorToPresenter: AnyObject {

    
//    func didSuccessGetReview(reviews: [Review])
//    func didFailed(response: String)
//    func didSuccessGetVideo(videos: Videos)
//    func didFailedGetVideo(response: String)
//
}


// presenter --> router
protocol MovieDetailPresenterToRouter: AnyObject {
    func navigateToVideoPlayer(from : MovieDetailPresenterToView, movie: Movie)
    func navigateToReview(from : MovieDetailPresenterToView, reviews: Movie) //TODO: reviews:[Review] olmcak
}





