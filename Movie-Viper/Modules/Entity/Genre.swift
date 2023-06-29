//
//  Genre.swift
//  viper-fetch-example
//
//  Created by Kenan Baylan on 27.06.2023.
//

import Foundation


struct Genres: Codable {
    var genres: [Genre]
}

struct Genre: Codable {
    var id: Int?
    var name: String?
}
