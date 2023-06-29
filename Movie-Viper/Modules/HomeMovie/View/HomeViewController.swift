//
//  HomeViewController.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var genreCollectionView: UICollectionView!
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var popularMoviesCollectionView: UICollectionView!
    
    
    var presenter: HomeViewToPresenter?
    let widthMovieItem = (Constant.screenWith - 50) / 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //   navigationItem.title = "Movie's Historial"
        
        presenter?.viewDidLoad()
        registerCell()
        
    }
    
    
    func registerCell() {
        
        popularMoviesCollectionView.delegate = self
        popularMoviesCollectionView.dataSource = self
        
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        
        let popularMovieNibname = MovieCollectionViewCell.identifier
        popularMoviesCollectionView.register(UINib(nibName: String(describing: MovieCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MovieCollectionViewCell.self))
        
        genreCollectionView.register(UINib(nibName: String(describing: GenreCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: GenreCollectionViewCell.self))
        
    }
    
}


extension HomeViewController: HomePresenterToView {
    
    func updateGenreCollectionView() {
        DispatchQueue.main.async {
            self.genreCollectionView.reloadData()
        }
    }
    
    func updatePopularCollectionView() {
        DispatchQueue.main.async {
            self.popularMoviesCollectionView.reloadData()
        }
        
    }
    
    
    func updateCarouselCollectionView() {
        //TODO: will be added
    }
    
}



extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView  {
        case popularMoviesCollectionView:
            return presenter?.movieList.count ?? 0
            
        case genreCollectionView:
            return presenter?.genreList.count ?? 0
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView {
        
        case popularMoviesCollectionView:
            let reuseIdentifier = MovieCollectionViewCell.identifier
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieCollectionViewCell.self) , for: indexPath) as! MovieCollectionViewCell
            
            
            if let presenter = presenter {
                let movie = presenter.movieList[indexPath.row]
                cell.setup(movie: movie)
            } else {
                print("Presenter is nil")
            }
    
            return cell
            
        case genreCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GenreCollectionViewCell.self) , for: indexPath) as! GenreCollectionViewCell
            
            if let genre = presenter?.genreList {
                cell.setup(genre: genre[indexPath.row])
            }
            
            return cell
            
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let height = widthMovieItem * 1.5
//        return CGSize(width: widthMovieItem, height: height)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
}
