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
    
    func navigateToGenreByMovie(from view: HomePresenterToView, genreId: Int) {
        
    }
    
    
    func navigateToDetailMovie(from view: HomePresenterToView, movie: Movie) {
        guard let view = view as? UIViewController else  {  return  }
        let movieDetailVC = ScreenConfigurator.shared.createMovieDetailScreen(movie: movie)
        view.navigationController?.pushViewController(movieDetailVC, animated: true)
        
    }
    
       
    
    
}
