//
//  Movie.swift
//  PA3
//
//  Created by SHIN YOON AH on 2020/08/16.
//  Copyright © 2020 SHIN YOON AH. All rights reserved.
//

import Foundation

struct MovieResponse: Decodable {
    var page: Int
    var results: [Movie]
}

struct Movie: Decodable {
    var id: Int
    var title: String
    var posterPath: String
    var overview: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "original_title"
        case posterPath = "backdrop_path"
        case overview = "overview"
    }
}
