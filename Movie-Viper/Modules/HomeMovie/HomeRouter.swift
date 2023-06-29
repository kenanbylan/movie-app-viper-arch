//
//  HomeViewRouter.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import Foundation
import UIKit


//MARK: Presenter  --> Router
class HomeRouter: HomePresenterToRouter {
    
    func navigateToListMovieByGenre(from view: HomePresenterToView, genreId: Int) {
       
        //
    }
    
    
    
    func navigateToDetailMovie(from: HomePresenterToView, movie: Movie) {
        //TODO: Movie'ye tıklandığında gidilecek sayfa olarak tanımlanacaktır.
    }
    
       
    
    
}
