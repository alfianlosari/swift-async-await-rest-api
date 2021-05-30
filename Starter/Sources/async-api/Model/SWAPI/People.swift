//
//  People.swift
//  async-api
//
//  Created by Alfian Losari on 5/29/21.
//

import Foundation

struct People: Decodable {
    let name: String
    let gender: String
    let birthYear: String
    let height: String
    let mass: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case birthYear = "birth_year"
        case height
        case mass
    }
    
    static let url = URL(string: "https://www.swapi.tech/api/people")!
    static func url(id: String) -> URL {
        URL(string: "https://www.swapi.tech/api/people/\(id)")!
    }
}
