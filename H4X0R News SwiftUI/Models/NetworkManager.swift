//
//  NetworkManager.swift
//  H4X0R News SwiftUI
//
//  Created by Giorgi Goginashvili on 11/27/23.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print(error)
            }
            guard let safeData = data else { return }
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(Results.self, from: safeData)
                DispatchQueue.main.async {
                    self?.posts = results.hits
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
