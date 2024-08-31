//
//  MenuController.swift
//  Restaurant
//
//  Created by Mobman on 31/08/2024.
//

import Foundation

typealias MinutesToPrepare = Int

class MenuController {
    let baseURL = URL(string: "http://localhost:8080")!
    
    func fetchCatagories() async throws -> [String] {
        let catagoriesURL = baseURL.appendingPathComponent("catagories")
        let (data, response) = try await URLSession.shared.data(from: catagoriesURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {throw MenuControllerError.catagoriesNotFound}
        
        let decoder = JSONDecoder()
        let catagoriesResponse = try decoder.decode(CatagoriesResponse.self, from: data)
        
        return catagoriesResponse.Catagories
    }
    
    func fetchMenuItems(forCatagory categoryName: String) async throws -> [MenuItem] {
        let baseMenuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: baseMenuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "catagory", value: categoryName)]
        let menuURL = components.url!
        
        let (data, response) = try await URLSession.shared.data(from: menuURL)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {throw MenuControllerError.menuItemsNotFound}
        
        let decoder = JSONDecoder()
        let menuResponse = try decoder.decode(MenuResponse.self, from: data)
        
        return menuResponse.items
    }
    
    func submitOrder(forMenuIDs menuIDs: [Int]) async throws -> MinutesToPrepare {
        let orderURL = baseURL.appendingPathComponent("order")
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let menuIdsDict = ["menuIds": menuIDs]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(menuIdsDict)
        request.httpBody = jsonData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {throw MenuControllerError.orderRequestFailed}
        
        let decoder = JSONDecoder()
        let orderResponse = try decoder.decode(OrderResponse.self, from: data)
        
        return orderResponse.prepTime
    }
    
    enum MenuControllerError: Error, LocalizedError {
        case catagoriesNotFound
        case menuItemsNotFound
        case orderRequestFailed
    }
}
