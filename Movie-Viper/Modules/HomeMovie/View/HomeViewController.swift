//
//  HomeViewController.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var popularMoviesCollectionView: UICollectionView!

    @IBOutlet weak var newMoviesCollectionView: UICollectionView!
    
    var presenter: HomeViewToPresenter?
    let widthMovieItem = (Constant.screenWith - 50) / 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        presenter?.viewDidLoad()
        registerCell()
        
    }
    
    
    
    func registerCell() {
        popularMoviesCollectionView.delegate = self
        popularMoviesCollectionView.dataSource = self
        
        let popularMovieNibname = MovieCollectionViewCell.identifier
        popularMoviesCollectionView.register(UINib(nibName: String(describing: MovieCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MovieCollectionViewCell.self))
        
    }
    
    @IBAction func genreFilterButton(_ sender: Any) {
        print("Clicked genre filter button.")
        
    }
    
    
}


extension HomeViewController: HomePresenterToView {
    
    func updateNewsCollectionView() {
        DispatchQueue.main.async {
            self.popularMoviesCollectionView.reloadData()
        }
    }
    
    func updatePopularCollectionView() {
        DispatchQueue.main.async {
            self.popularMoviesCollectionView.reloadData()
        }
    }
    
}



extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.movieList.count ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let reuseIdentifier = MovieCollectionViewCell.identifier
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieCollectionViewCell.self) , for: indexPath) as! MovieCollectionViewCell
        
        
        print("presenter.movielist44", presenter?.movieList)
        
        if let movies = presenter?.movieList {
            cell.setup(movie: movies[indexPath.row])
        }
        
        return cell
    }
    
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = widthMovieItem * 1.5
        return CGSize(width: widthMovieItem, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
