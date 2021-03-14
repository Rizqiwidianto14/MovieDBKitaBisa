//
//  Model.swift
//  MovieDBKitaBisa
//
//  Created by Rizqi Imam Gilang Widianto on 12/03/21.
//

import Foundation


struct Results {
    let movies: [Movies]
}

extension Results: Decodable {
    
    private enum ResultsCodingKeys: String, CodingKey {
        case movies = "results"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultsCodingKeys.self)
        movies = try container.decode([Movies].self, forKey: .movies)
        
    }
    
}


struct Movies {
    let id: Int
    let posterPath: String
    let title: String
    let releaseDate: String
    let overview: String
}

extension Movies: Decodable {
    enum MovieCodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
        case releaseDate = "release_date"
        case overview
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        posterPath = try container.decode(String.self, forKey: .posterPath)
        title = try container.decode(String.self, forKey: .title)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
        overview = try container.decode(String.self, forKey: .overview)
    }
}

struct MovieDetail: Decodable{
    
    let overview: String
    let originalTitle: String
    let posterPath: String
    let releaseDate: String
    
    
    enum CodingKeys: String, CodingKey {
        case overview
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
    }
    
}






