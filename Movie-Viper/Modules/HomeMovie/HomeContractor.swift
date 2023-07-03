//
//  HomeContractor.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 24.06.2023.
//

import Foundation



//MARK: HomeView -> Presenter

protocol HomeViewToPresenter: AnyObject {
    
    var view: HomePresenterToView? { get set }
    var interactor: HomePresenterToInteractor? { get set }
    var router: HomePresenterToRouter? { get set }
    
    var movieList: [Movie] { get set }
    var genreList: [Genre] { get set }
    
    var carouselList: [Movie] { get set }
    
    func viewDidLoad()
    func didSelectedMovieAt(movie: Movie)
    func didSelectGenreAt(genreId: Int?)
    
}


protocol HomePresenterToView: AnyObject {
    
    var presenter: HomeViewToPresenter? {get set}
    
    func updateGenreCollectionView()
    func updatePopularCollectionView()
    func updateCarouselCollectionView()
    
}


//presenter --> ınteractor
protocol HomePresenterToInteractor: AnyObject{
    
    var presenter: HomeInteractorToPresenter? {get set}
    func getGenres()
    func getMovieListDiscover()
}

protocol HomeInteractorToPresenter: AnyObject {
    
    func didSuccessGetGenre(response: [Genre])
    func didFailedGetGenre(error: String)
    
    func didSuccessGetMovieListDiscover(response: [Movie])
    func didFailedGetMovieListDiscover(error: String)
    
}

protocol HomePresenterToRouter: AnyObject {
  //  func navigateToListMovieByGenre(from: HomePresenterToView, genreId: Int)
    func navigateToDetailMovie(from: HomePresenterToView, movie: Movie)
}





