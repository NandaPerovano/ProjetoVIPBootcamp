//
//  FilmeViewController.swift
//  ProjetoVIPBootcamp
//
//  Created by Fernanda Perovano on 13/10/23.
//

import UIKit

class FilmeViewController: UIViewController, MoviesPresenterOutput {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: FilmePresenter! // Use the class-level presenter
      
      private var movies: [Movies] = []

      override func viewDidLoad() {
          super.viewDidLoad()
          configCollectionView()
          presenter = FilmePresenter()
          presenter.view = self
          presenter.fetchMovies()
      }
    
    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FilmeCollectionViewCell.nib(), forCellWithReuseIdentifier: FilmeCollectionViewCell.identifier)
    }
    
    func displayMovies(movies: [Movies]) {
        self.movies = movies
        collectionView.reloadData()
        print("Movies displayed: \(movies.count)")
    }
    
    func displayError(message: String) {
        // Handle and display the error message
        print("Error occurred: \(message)")
    }
}


extension FilmeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmeCollectionViewCell.identifier, for: indexPath) as? FilmeCollectionViewCell
        let movie = movies[indexPath.row]
        cell?.customCell(nome: movie.name)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = DetalhesFilmeViewController()
//        present(vc, animated: true, completion: nil)
//        let selectedMovie = movies.movieList[indexPath.row]
//        vc.movieCustomCell(imagem: selectedMovie.photo, resumo: selectedMovie.sumary)
    }
}



