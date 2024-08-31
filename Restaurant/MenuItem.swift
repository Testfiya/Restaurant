//
//  MenuItem.swift
//  Restaurant
//
//  Created by Mobman on 31/08/2024.
//

import Foundation

struct MenuItem: Codable {
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var catagory: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case catagory
        case imageURL = "image_url"
    }
}
