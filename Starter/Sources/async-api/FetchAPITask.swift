//
//  FetchAPITask.swift
//  async-api
//
//  Created by Alfian Losari on 5/29/21.
//

import Foundation

func fetchAPI<D: Decodable>(url: URL, completion: @escaping (Result<D, Error>) -> ()) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Bad HTTP Response"])))
            return
        }
        
        do {
            let decodedData = try JSONDecoder().decode(D.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    .resume()
}
