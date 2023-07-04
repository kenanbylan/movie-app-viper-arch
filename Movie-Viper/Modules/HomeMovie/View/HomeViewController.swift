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
    @IBOutlet weak var pageControl: UIPageControl!
    
    var presenter: HomeViewToPresenter?
    let widthMovieItem = (Constant.screenWith - 50) / 2
    
    var timer: Timer?
    var currentIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Movie's Historial"
        
        presenter?.viewDidLoad()
        registerCell()
        
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
        
    }
    
    @objc func autoScroll() {
        let nextIndex = (currentIndex + 1) % (presenter?.carouselList.count ?? 0)
        currentIndex = nextIndex
        let indexPath = IndexPath(item: nextIndex, section: 0)
        carouselCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = nextIndex
    }
    
    //TODO: do refactoring.
    func registerCell() {
        
        popularMoviesCollectionView.delegate = self
        popularMoviesCollectionView.dataSource = self
        
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        
        let popularMovieNibname = MovieCollectionViewCell.identifier
        popularMoviesCollectionView.register(UINib(nibName: popularMovieNibname , bundle: nil), forCellWithReuseIdentifier: popularMovieNibname)
        
        let genreNibname = GenreCollectionViewCell.identifier
        genreCollectionView.register(UINib(nibName: genreNibname, bundle: nil), forCellWithReuseIdentifier: genreNibname )
        
        let carouselNibname = CarouselCollectionViewCell.identifier
        carouselCollectionView.register(UINib(nibName: carouselNibname, bundle: nil), forCellWithReuseIdentifier: carouselNibname)
        
        
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
        DispatchQueue.main.async {
            self.carouselCollectionView.reloadData()
            self.pageControl.numberOfPages = self.presenter?.carouselList.count ?? 0
            self.pageControl.currentPage = 0
            self.autoScroll()
        }
        
    }
    
}



extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView  {
        case popularMoviesCollectionView:
            return presenter?.movieList.count ?? 0
            
        case genreCollectionView:
            return presenter?.genreList.count ?? 0
            
        case carouselCollectionView:
            return presenter?.carouselList.count ?? 5
            
            
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
            
            
        case carouselCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CarouselCollectionViewCell.self), for: indexPath) as! CarouselCollectionViewCell
            
            
            
            if let presenter = presenter {
                
                let topMovie = presenter.carouselList[indexPath.row]
                cell.setup(movie: topMovie)
                
            } else {
                print("Carousel presenter is nil")
            }
            
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch collectionView {
            
        case popularMoviesCollectionView :
            
            let vc = MovieDetailViewController(nibName: "MovieDetailViewController", bundle: nil)
            if let movie = presenter?.movieList {
                presenter?.didSelectedMovieAt(movie: movie[indexPath.row])
            }
            
        default:
            break
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
