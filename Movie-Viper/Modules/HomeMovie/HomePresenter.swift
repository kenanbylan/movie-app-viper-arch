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
    var carouselList: [Movie] = []
    
    
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
        
        self.updateCarouselList()
        view?.updatePopularCollectionView()
    
        print("Carousel item: ", carouselList)
    }
    
    func didFailedGetMovieListDiscover(error: String) {
        print("ERROR: ",error);
        //TODO: Alert ile kullanıcıya döndürülmelidir.
        
    }
}

extension HomePresenter {
    
    func updateCarouselList() {
        
        guard !movieList.isEmpty else {
            print("Movie list is NULL!!")
            return
        }
        
        let randomIndexes = (0..<movieList.count).shuffled().prefix(4)
        carouselList = randomIndexes.map { movieList[$0] }
        view?.updateCarouselCollectionView()
    }
    
}
