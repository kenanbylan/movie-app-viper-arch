//
//  MovieDetailViewController.swift
//  Movie-Viper
//
//  Created by Kenan Baylan on 3.07.2023.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var presenter: MovieDetailViewToPresenter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension MovieDetailViewController: MovieDetailPresenterToView {

    
    
    func getData() {
        
    }
    
    func showLoading() {
            
    }
    
    func hideLoading() {
        
    }
    
    
    
}
