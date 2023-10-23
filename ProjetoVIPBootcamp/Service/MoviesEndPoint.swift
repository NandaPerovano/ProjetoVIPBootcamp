//
//  MoviesEndPoint.swift
//  ProjetoVIPBootcamp
//
//  Created by Fernanda Perovano on 21/10/23.
//
       
import Foundation

struct MoviesResponse: Codable {
    let data: [Movies]
}

struct MoviesEndPoint {
    static func fetchMovies(completion: @escaping ([Movies]?, Error?) -> Void) {
        let urlString = "https://mcuapi.herokuapp.com/api/v1/movies?page=1&limit=1000&columns=title%2Crelease_date%2Cphase%2Cpost_credit_scenes%2Ccover_url%2Csaga%2Cdirected_by%2Coverview&order=chronology%2CDESC"
        
        guard let url = URL(string: urlString) else {
            completion(nil, nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            if let data = data {
                do {
                    let moviesResponse = try JSONDecoder().decode(MoviesResponse.self, from: data)
                    completion(moviesResponse.data, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }.resume()
    }
    
}
