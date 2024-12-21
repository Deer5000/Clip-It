//
//  WebService.swift
//  ClipIt
//
//  Created by Khidr Brinkley on 12/21/24.
//

import Foundation

class WebService {
    func fetchProductData() async throws -> Product {
        let urlString = "https://dummyjson.com/products"
        guard let url = URL(string: urlString) else {
            throw ErrorCases.invalidUrl
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Product.self,from: data)
        } catch {
            throw ErrorCases.invalidData
        }
    }
}
