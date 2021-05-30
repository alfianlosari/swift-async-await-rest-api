//
//  FreeGeoIPResponse.swift
//  async-api
//
//  Created by Alfian Losari on 5/29/21.
//

import Foundation

struct FreeGeoIPResponse: Decodable {
    
    let ip: String
    let countryCode: String
    let regionCode: String
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case ip
        case countryCode = "country_code"
        case regionCode = "region_code"
        case latitude
        case longitude
        
    }
    
    static func url(ipAddress: String) -> URL {
        return URL(string: "https://freegeoip.app/json/\(ipAddress)")!
    }
}
