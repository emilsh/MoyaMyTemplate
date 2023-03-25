//
//  ViewController.swift
//  MoyaMyTemplate
//
//  Created by Emil Shafigin on 25/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.loadMovieDetail(movieId: "550") { result in
            print(result.homepage)
        }
    }    
}

class ViewModel {
    var networkManager: NetworkManager
    
    var movieDetail: MovieDetailResponse?
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func loadMovieDetail(movieId: String, completion: @escaping (MovieDetailResponse) -> ()) {
        networkManager.fetcMovieDetail(movieId: movieId) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            
            case .success(let movieDetailResponse):
                self.movieDetail = movieDetailResponse
                completion(movieDetailResponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


