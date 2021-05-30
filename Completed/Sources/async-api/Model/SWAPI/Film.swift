//
//  Film.swift
//  async-api
//
//  Created by Alfian Losari on 5/29/21.
//

import Foundation

struct Film: Decodable {
    let characters: [String]
    let title: String
    let director: String
    let releaseDate: String
    
    var characterURLs: [URL] {
        characters.compactMap { URL(string: $0) }
    }
    
    enum CodingKeys: String, CodingKey {
        case characters
        case title
        case director
        case releaseDate = "release_date"
    }
    
    static let url = URL(string: "https://www.swapi.tech/api/films")!
    static func url(id: String) -> URL {
        URL(string: "https://www.swapi.tech/api/films/\(id)")!
    }
    
}
