//  MovieDetailViewController.swift
//  Movie-Viper
//  Created by Kenan Baylan on 3.07.2023


import UIKit
import Kingfisher
import ProgressHUD

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet var imdbScoreLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var movieLanguageLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieAdultLabel: UILabel!
    
    
    var presenter: MovieDetailViewToPresenter?
    
    var didSelectMovieName: String? {
        didSet {
            navigationItem.title = didSelectMovieName
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()

        
        setupConfig()
    }
    
    func setupConfig() {
        
        if let movie = presenter?.movie {
            
            didSelectMovieName = movie.title
            
            let url = (URL(string: "\(HomeManager.baseImgUrl)\(movie.posterPath)"))
            movieImage.kf.setImage(with: url)
            
            overviewLabel.text = movie.overview
            imdbScoreLabel.text = "\(movie.voteAverage)/10"
            movieLanguageLabel.text = movie.originalLanguage.uppercased()
            movieDateLabel.text = movie.releaseDate //TODO: Convert to date's
            movieAdultLabel.text = movie.adult == true ? "+18" : "Family"
        }
        
        
    }
    
    @IBAction func watchTrailerButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func seeReviewsButtonPressed(_ sender: Any) {
        
    }
    
    
}




extension MovieDetailViewController: MovieDetailPresenterToView {
    
    
    func getData() {
        
    }
    
    func showLoading() {
        ProgressHUD.show()
    }
    
    func hideLoading() {
        ProgressHUD.dismiss()
    }
    
    
    
}
