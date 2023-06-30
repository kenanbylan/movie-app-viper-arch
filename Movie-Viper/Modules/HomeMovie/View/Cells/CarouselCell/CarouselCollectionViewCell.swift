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
        // Initialization code
    }
    
    func setup(movie: Movie) {
        let url = (URL(string: "\(HomeManager.baseImgUrl)\(movie.posterPath)"))
        self.imageView.kf.setImage(with: url)
    }
    

}
