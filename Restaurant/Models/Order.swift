//
//  Order.swift
//  Restaurant
//
//  Created by Mobman on 31/08/2024.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
