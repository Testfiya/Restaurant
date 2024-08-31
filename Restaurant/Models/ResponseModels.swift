//
//  ResponseModels.swift
//  Restaurant
//
//  Created by Mobman on 31/08/2024.
//

import Foundation

struct MenuResponse: Codable {
    let items: [MenuItem]
}

struct CatagoriesResponse: Codable {
    let Catagories: [String]
}

struct OrderResponse: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
