//
//  ViewController.swift
//  TheMovieDBAPI
//
//  Created by Ahmet Ali ÇETİN on 20.07.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getPopularMovies()
        getPopularTVShows()
    }

    private func getPopularMovies() {
        NetworkManager.shared.getPopularMovies { result in
            switch result {
            case .success(let movies):
                print(movies.title)
                print(movies.releaseDate)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func getPopularTVShows() {
        NetworkManager.shared.getPopularTVShows { result in
            switch result {
            case .success(let tvShows):
                print(tvShows.name)
                print(tvShows.firstAirDate)
                print(tvShows.firstAirDate)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    
}

