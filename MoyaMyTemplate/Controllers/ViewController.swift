//
//  ViewController.swift
//  MoyaMyTemplate
//
//  Created by Emil Shafigin on 25/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let networkManager = NetworkManager()
    
    var movieDetail: MovieDetailResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMovieDetail(movieId: "550")
        print(movieDetail?.homepage)
    }
    
    func loadMovieDetail(movieId: String) {
        networkManager.fetcMovieDetail(movieId: movieId) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            
            case .success(let movieDetailResponse):
                self.movieDetail = movieDetailResponse
                print(self.movieDetail?.homepage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

