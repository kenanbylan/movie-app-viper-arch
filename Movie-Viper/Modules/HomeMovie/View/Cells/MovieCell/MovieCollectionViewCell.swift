//
//  MovieCollectionViewCell.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 28.06.2023.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: MovieCollectionViewCell.self)
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieSubTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureView()
    }
    
    
    
    func setup(movie: Movie) {
        movieTitleLabel.text = movie.title
        movieSubTitleLabel.text = movie.overview
        let url = (URL(string: "\(NetworkHelper.shared.baseUrl)\(movie.posterPath)"))
        self.movieImageView.kf.setImage(with: url)
    }
    
    
    func configureView() {
        
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = CGRect(x: 0, y: backView.frame.minY, width: backView.frame.size.width, height: backView.frame.size.height)
//
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        self.layer.cornerRadius = 10
//        movieImageView.layer.cornerRadius = 5
//        movieImageView.addSubview(blurEffectView)
    }

}
