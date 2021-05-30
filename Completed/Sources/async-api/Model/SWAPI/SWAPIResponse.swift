//
//  SWAPIResponse.swift
//  async-api
//
//  Created by Alfian Losari on 5/29/21.
//

import Foundation

struct SWAPIResponse<D: Decodable>: Decodable {
    
    let response: D
    
    enum CodingKeys: String, CodingKey {
        case result
    }
    
    enum ResultKeys: String, CodingKey {
        case properties
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let result = try container.nestedContainer(keyedBy: ResultKeys.self, forKey: .result)
        response = try result.decode(D.self, forKey: .properties)
    }
}
