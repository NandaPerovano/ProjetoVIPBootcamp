//
//  Movies.swift
//  ProjetoVIPBootcamp
//
//  Created by Fernanda Perovano on 13/10/23.
//

import Foundation
import UIKit

//struct Movies {
//    
//    var name: String
//    var photo: UIImage?
//    var sumary: String
//}
//struct MovieResponse: Codable {
//    let movies: [Movies]
//}

struct Movies: Codable {
    
    var name: String
    var photo: String
    var releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        
        case name = "title"
        case photo = "cover_url"
        case releaseDate = "release_date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decodeIfPresent(String.self , forKey: .name) ?? ""
        photo = try values.decodeIfPresent(String.self , forKey: .photo) ?? ""
        releaseDate = try values.decodeIfPresent(String.self , forKey: .releaseDate) ?? ""
    }
    
}
