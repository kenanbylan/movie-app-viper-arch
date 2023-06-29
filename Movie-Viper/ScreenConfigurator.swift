//
//  ScreenConfigurator.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import Foundation
import UIKit

class ScreenConfigurator {
    
    public static let shared = ScreenConfigurator()
        
    func createHomeScreen() -> UIViewController {
        
        let view: UIViewController & HomePresenterToView = HomeViewController()
        let presenter: HomeViewToPresenter & HomeInteractorToPresenter = HomePresenter()
        let interactor: HomePresenterToInteractor = HomeInteractor()
        let router: HomePresenterToRouter = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    
    
    
}
