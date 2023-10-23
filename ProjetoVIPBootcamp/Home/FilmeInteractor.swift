//
//  FilmeInteractor.swift
//  ProjetoVIPBootcamp
//
//  Created by Fernanda Perovano on 13/10/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MoviesInteractorInput {
    func fetchMovies()
}

protocol MoviesInteractorOutput {
    func moviesFetched(movies: [Movies])
    func moviesFetchFailed(error: Error)
}

public class FilmeInteractor: MoviesInteractorInput {
    
    var presenter: MoviesInteractorOutput?
        
        func fetchMovies() {
            MoviesEndPoint.fetchMovies { [weak self] (movies, error) in
                if let error = error {
                    self?.presenter?.moviesFetchFailed(error: error)
                } else if let movies = movies {
                    self?.presenter?.moviesFetched(movies: movies)
                }
            }
        }
    }
    

    
  
    
//    func numberMovies() -> Int {
//        movies.movieList.count
//    }
//
//    func getCellViewModel(posicao: Int) -> Movies {
//        let filme = movies.movieList[posicao]
//        return filme
//        }
//}
