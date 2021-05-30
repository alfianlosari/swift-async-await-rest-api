//
//  RestCountriesReponse.swift
//  async-api
//
//  Created by Alfian Losari on 5/29/21.
//

import Foundation

struct RestCountriesResponse: Decodable {
    
    let topLevelDomain: [String]
    let callingCodes: [String]
    let capital: String
    let region: String
    let subregion: String
    let population: Int
    let currencies: [Currrency]
    let cioc: String
    
    struct Currrency: Decodable {
        let code: String
        let name: String
        let symbol: String
    }
    
    static func url(countryCode: String) -> URL {
        return URL(string: "https://restcountries.eu/rest/v2/alpha/\(countryCode)")!
    }
}
