//
//  IpifyResponse.swift
//  async-api
//
//  Created by Alfian Losari on 5/29/21.
//

import Foundation

struct IpifyResponse: Decodable {
    let ip: String
    
    static let url = URL(string: "https://api.ipify.org/?format=json")!
}
