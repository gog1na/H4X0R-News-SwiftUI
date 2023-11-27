//
//  PostData.swift
//  H4X0R News SwiftUI
//
//  Created by Giorgi Goginashvili on 11/27/23.
//

import Foundation

struct Results: Codable {
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    let id: String
    let points: Int
    let title: String
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "objectID"
        case points 
        case title
        case url
    }
}
