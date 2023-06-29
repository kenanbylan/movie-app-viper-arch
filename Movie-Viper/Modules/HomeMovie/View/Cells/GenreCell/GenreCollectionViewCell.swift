//
//  GenreCollectionViewCell.swift
//  Movie-Viper
//
//  Created by Kenan Baylan on 29.06.2023.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var genreTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    func setup(genre: Genre) {
        genreTitle.text = genre.name
    }
    
}
