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
    
    
    
    override var isSelected: Bool {
        didSet {
            updateSelectionStyle()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        
    }
    
    func setup(genre: Genre) {
        genreTitle.text = genre.name
    }
    
    
    private func setupUI() {
        // BackView için corner radius ayarı yapabilirsiniz
        backView.layer.cornerRadius = 8.0
        backView.layer.masksToBounds = true
    }
    
    private func updateSelectionStyle() {
        // Hücre seçildiğinde veya seçim kaldırıldığında animasyonlar yapabilirsiniz
        UIView.transition(with: backView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            if self.isSelected {
                self.backView.backgroundColor = .lightGray
            } else {
                self.backView.backgroundColor = .clear
            }
        }, completion: nil)
        
    }
    
}
