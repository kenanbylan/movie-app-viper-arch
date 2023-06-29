//
//  HomeViewPresenter.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import Foundation


class HomePresenter: HomeViewToPresenter {
    
    
    var view: HomePresenterToView?
    var interactor: HomePresenterToInteractor?
    var router: HomePresenterToRouter?
    
    
    var movieList: [Movie] = []
    var genreList: [Genre] = []

    func viewDidLoad() {
        
        interactor?.getMovieListDiscover()
        interactor?.getGenres()
        
    }
    
    // MARK: Herhangi bir movie view'ına tıklandığında çalışacaktır.
    func didSelectedMovieAt(movie: Movie) {
        router?.navigateToDetailMovie(from: self.view!, movie: movie)
    }
    
    func didSelectGenreAt(genreId: Int?) {
        //TODO: It will then be coded
    }
    
}

extension HomePresenter: HomeInteractorToPresenter {
    
    func didSuccessGetGenre(response: [Genre]) {
        self.genreList = response
        view?.updateGenreCollectionView()
    }
    
    func didFailedGetGenre(error: String) {
        //TODO: will be added alert
    }
    
    func didSuccessGetMovieListDiscover(response: [Movie]) {
        self.movieList = response //çekilen datalar bu sayfadaki arrayde tutuluyor.
        view?.updatePopularCollectionView()
        // viewdaki çekilen datalardan sonra collectionView reload edilir.
    }
    
    func didFailedGetMovieListDiscover(error: String) {
        print("ERROR: ",error);
        //TODO: Alert ile kullanıcıya döndürülmelidir.
    }
    
}
