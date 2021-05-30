//
//  FetchAPITask.swift
//  async-api
//
//  Created by Alfian Losari on 5/29/21.
//

import Foundation

func fetchAndDecode<D: Decodable>(url: URL) async throws -> D {
    let data = try await URLSession.shared.data(with: url)
    let decodedData = try JSONDecoder().decode(D.self, from: data)
    return decodedData
}

func fetchAPI<D: Decodable>(url: URL) async throws -> D {
    let task = Task { () -> D in
        try await fetchAndDecode(url: url)
    }
    return try await task.value
}

func fetchAPIGroup<D: Decodable>(urls: [URL]) async throws -> [D] {
    try await withThrowingTaskGroup(of: D.self) { (group)  in
        for url in urls {
            group.async { try await fetchAndDecode(url: url) }
        }
        var results = [D]()
        for try await result in group {
            results.append(result)
        }
        return results
    }
}

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
