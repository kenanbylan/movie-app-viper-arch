//
//  CarouselCollectionViewCell.swift
//  Movie-Viper
//
//  Created by Kenan Baylan on 29.06.2023.
//

import UIKit
import Kingfisher

class CarouselCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CarouselCollectionViewCell.self)
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
    
    func setup(movie: Movie) {
        
        let url = (URL(string: "\(HomeManager.baseImgUrl)\(movie.posterPath)"))
        self.imageView.kf.setImage(with: url)
    }
    
    func configureUI() {
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.cornerRadius = 10
        
        imageView.layer.cornerRadius = 10
        
        
    }
    
    
}
